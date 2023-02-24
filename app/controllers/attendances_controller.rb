class AttendancesController < ApplicationController
  def new
      @attendance = Attendance.new()
      @event = Event.find(params[:event])
  end

  def create
    # @attendance = Attendance.new(event_id:params[:event],attendant: current_user)
    # redirect_to checkout_create_url(total: @attendance.event.price)
    # # if @attendance.save
    #   puts "OK"
  
      
    # else
    #   puts "PAS OK"
    # end
  end
end
