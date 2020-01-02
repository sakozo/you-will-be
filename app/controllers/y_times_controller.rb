class YTimesController < ApplicationController

  def index
    @user = User.find(current_user.id)        #ユーザー情報
    @goal = Goal.find(current_user.goal_id)   #ユーザーのgoal_idをみて目標を出力
    
    @required_week = (@goal.time / @user.week_time).round
    @required_month = (@required_week / 4).round

    @achievement_date = (Date.current + (7 * @required_week)).strftime("%Y年%-m月%-d日")
    # @date = (Date.current - @user.created_at.to_date + 1).numerator 
    #binding.pry
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update

  end

  def show
    
  end

  def create
    y_time = YTime.create(y_time_params)
    redirect_to user_path(current_user.id)
  end

  private

  def y_time_params
    params.require(:y_time).permit(:time,:note).merge(user_id: current_user.id, goal_id: current_user.goal_id)
  end

end
