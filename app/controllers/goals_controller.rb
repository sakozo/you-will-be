class GoalsController < ApplicationController
  def index
    if user_signed_in?
    if current_user.goal_id != nil && current_user.email !="testtest@test"
      redirect_to user_path(current_user.id)
    end
    end
  end

  def show 
    @user = User.find(current_user.id)
    @goal = Goal.new()

    #挑戦者が多い順に並べ替え########################################################
    goals = Goal.all
    goals_list = []
    goals.each do |goal|
      goals_list << goal
    end
    @goals_ordered_list = goals_list.sort_by {|goal| goal.users.count }.reverse
    #############################################################################
  end

  def new
    @goal = Goal.new()
  end

  def create
    Goal.create(goal_params)
    redirect_to goal_path(current_user.id)
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
