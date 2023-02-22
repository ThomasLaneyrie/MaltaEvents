class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_that_you?, only: [:show]

  def show
    @user = User.find(params[:id])
  end


  private

  def is_that_you?
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, danger: "N'étant pas votre compte, il vous est impossible d'accéder à ce profil. Vous êtes automatiquement redirigé vers la page d'accueil"
    end
  end
end
