class Admin::UsersController < ApplicationController
  # layout 'admin'
  before_action :authenticate_user!, :check_if_admin

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_root_path

  end

  private
  def check_if_admin
    unless current_user.is_admin?
      redirect_to root_path, danger: "Vous ne pouvez pas accéder à cette page, n'étant pas administrateur, désolé !"
    end
  end
end
