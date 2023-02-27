class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :check_if_admin, only: [:index]

  def index
    @event=Event.find(params[:event_id])
    @attendances = Attendance.where(event_id:params[:event_id])
  end


  private
  def check_if_admin
    unless current_user.is_admin?
      binding.pry
      redirect_to events_path 
      flash[:danger] = "Vous ne pouvez pas accéder à cette page, n'étant pas administrateur, désolé !"   # Marche pas (Car dans le truc du before_action ?)
    end
  end
end
