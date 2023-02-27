class CheckoutController < ApplicationController
  def create
  @total = params[:total].to_d                                                 
  @session = Stripe::Checkout::Session.create(                             
    payment_method_types: ['card'],
    line_items: [
      {
        price_data: {
          currency: 'eur',
          unit_amount: (@total*100).to_i,
          product_data: {
            name: 'Rails Stripe Checkout',
          },
        },
        quantity: 1
      },
    ],  
    mode: 'payment',
    success_url: event_checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
    cancel_url: event_checkout_cancel_url,
  )
  redirect_to @session.url, allow_other_host: true
end

def success   
  @session = Stripe::Checkout::Session.retrieve(params[:session_id])                
  @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  @event = Event.find(params[:event_id])
  @attendance = Attendance.new(event_id:@event.id, attendant:current_user, stripe_customer_id:@session.id)
  if @attendance.save
    redirect_to event_path(@event.id)
    flash[:success] = "Ta participation est bien enregistrée !"
  else
    redirect_to events_path
    flash[:danger] = "Ton payement est bien passé mais il y a un problème pour enregistrer ta participation. Contactez-nous"
  end
end

def cancel                                                           
end   

end