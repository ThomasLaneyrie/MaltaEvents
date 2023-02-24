class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :is_validated?, only: [:show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.administrator = current_user
    if @event.save
      redirect_to events_path
      flash[:success] = "L'event a été créé avec succès, il est maintenant en attente de validation par les administrateurs" 
    else
      redirect_to new_event_path
      flash[:danger] = "L'event n'a pas pu être créé, recommence"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :duration, :price, :photoevent)
  end

  def is_validated?
    @event = Event.find(params[:id])
    unless @event.validated == true
      redirect_to root_path
      flash[:danger] = "Impossible d'afficher cet évènement, il n'est pas encore validé"     # Marche pas (Car dans le truc du before_action ?)
    end
  end
end