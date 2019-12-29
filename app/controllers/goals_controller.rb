class GoalsController < ApplicationController
  def index
  end

  def show
    @goals = Goal.all
  end

  def new
    @goal = Goal.new()
  end

  def create
    binding.pry
    Goal.create(goal_params)
    redirect_to edit_y_time_path(current_user.id)
  end

  
  private
  def goal_params
    params.require(:goal).permit(:name, :time, :image)
  end
end
