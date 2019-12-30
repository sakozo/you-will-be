class UsersController < ApplicationController
  def index
    
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    
      user = User.find(current_user.id)
      user.update(user_params)
      #binding.pry
    if user_params[:week_time] == nil
      redirect_to edit_y_time_path
    else
      redirect_to y_times_path
    end

  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:week_time,:image,:public_flag,:goal_id)
  end

  # def user_week_time_params
  #   params.require(:user).permit(:name,:goal_id, :week_time)
  # end

  # def user_goal_params
  #   params.require(:user).permit(:goal_id)
  # end
end
