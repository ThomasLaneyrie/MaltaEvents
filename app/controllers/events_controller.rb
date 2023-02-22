class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(administrator:current_user,title:params[:title],description:params[:description],location:params[:location], start_date:params[:start_date], duration:params[:duration].join.to_i, price:params[:price].join.to_i)
    if @event.save
      redirect_to event_path(@event.id), success: "L'event a été créé avec succès"  
    else
      redirect_to new_event_path, danger: "L'event n'a pas pu être créé, recommence"
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end