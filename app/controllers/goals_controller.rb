class GoalsController < ApplicationController
  def index
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
