class Admin::EventsController < ApplicationController
  # layout 'admin'
  before_action :authenticate_user!, :check_if_admin

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
    redirect_to admin_events_path
    # , success: "Event validé avec succès"
  end

  def destroy
  end

  private
  def check_if_admin
    unless current_user.is_admin?
      redirect_to root_path, danger: "Vous ne pouvez pas accéder à cette page, n'étant pas administrateur, désolé !"
    end
  end
end
