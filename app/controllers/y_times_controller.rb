class YTimesController < ApplicationController

  def index
    @user = User.find(current_user.id)        #ユーザー情報
    @goal = Goal.find(current_user.goal_id)   #ユーザーのgoal_idをみて目標を出力
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
