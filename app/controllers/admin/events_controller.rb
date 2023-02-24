class Admin::EventsController < ApplicationController
  # layout 'admin'
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @events = Event.where(validated:nil)
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.validated = params[:validated]
    @event.save
    if @event.validated == true
      redirect_to admin_events_path
      flash[:success] = "Event validé avec succès"
    else
      redirect_to admin_events_path
      flash[:warning] = "Event refusé avec succès"
    end
  end

  def destroy
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
