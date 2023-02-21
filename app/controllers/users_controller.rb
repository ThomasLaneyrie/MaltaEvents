class UsersController < ApplicationController
  before_action :is_that_you?, only: [:show]

  def show
    @user = User.find(params[:id])
  end





  private

  def is_that_you?
    @user = User.find(params[:id])
    
    if authenticate_user!
      if current_user.id == @user.id
        return true
      else
        return false
      end
    else
      return false
    end
  end

end
