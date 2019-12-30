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
    #userparamsがからじゃなかったらこっちみたいな分岐
    # User.create(user_params)
    # binding.pry
    # redirect_to edit_user_path(current_user.id)
    Goal.create(goal_params)
    redirect_to edit_y_time_path(current_user.id)
  end

  def edit
    # @user = User.find(current_user.id)
  end

  def update
    # User.update(user_params)
    # binding.pry
    # redirect_to edit_user_path(current_user.id)
  end

  
  private
  def goal_params
    params.require(:goal).permit(:name, :time, :image)
  end

  
end
