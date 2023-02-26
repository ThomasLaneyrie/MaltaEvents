class PhotoeventsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])                        
    @event.photoevent.attach(params[:photoevent])                     
    redirect_to(event_path(@event))      
  end
end

