class PhotoeventsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])                  
    @event.photoevent.attach(params[:photoevent])       
    puts "PHOTO OK"          
    redirect_to(event_path(@event))
    # redirect_to event_path(@event) 
  end
end

# private
#   def like_params
#     params.require(:like).permit(:gossip_id)
#   end