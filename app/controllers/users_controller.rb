class UsersController < ApplicationController
  def index
    
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    
    user = User.find(current_user.id)
    user.update(user_week_time_params)
    #binding.pry
    redirect_to y_times_path
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def user_week_time_params
    params.require(:user).permit(:name,:goal_id, :week_time)
  end
end
