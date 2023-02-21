class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
  end

  def show
    # binding.pry
    @attendance = Attendance.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
