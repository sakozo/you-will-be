class YTimesController < ApplicationController

  def index
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    user.update(y_time_params)
    redirect_to y_times_path
  end

  def show
    
  end

  private
  def y_time_params
    params.require(:user).permit(:time)
  end
end
