class UsersController < ApplicationController
  def index
    
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
      user = User.find(current_user.id)
      user.update(user_params)
    if user_params[:week_time] == nil
      redirect_to edit_y_time_path
    else
      redirect_to y_times_path
    end

  end

  def show
    @user = User.find(params[:id])
    @goal = Goal.find(current_user.goal_id)
    @date = (Date.current - @user.created_at.to_date).numerator
    #binding.pry

    @y_time = YTime.new() #入力フォーム用
  end

  def new
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:week_time,:image,:public_flag,:goal_id)
  end
end
