class GoalsController < ApplicationController
  def index
    if user_signed_in?
    if current_user.goal_id != nil
      redirect_to user_path(current_user.id)
    end
    end
  end

  def show
    @user = User.find(current_user.id)
    @goals = Goal.all
  end

  def new
    @goal = Goal.new()
  end

  def create
    Goal.create(goal_params)
    redirect_to edit_y_time_path(current_user.id)
  end

  def edit
    
  end

  def update

  end

  
  private
  def goal_params
    params.require(:goal).permit(:name, :time, :image)
  end
end
