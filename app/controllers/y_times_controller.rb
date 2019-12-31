class YTimesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @goal = Goal.find(current_user.goal_id)
    #binding.pry
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update

  end

  def show
    
  end

  private

end
