class Users::RankingsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @goal = Goal.find(current_user.goal_id)
    #@same_goal_users = Goal.find(current_user.goal_id).users

    # @same_goal_users = Goal.find(current_user.goal_id).y_times.joins(:user).group(:user_id).sum(:time)

    @same_goal_users = Goal.find(current_user.goal_id).y_times.joins(:user).group(:user).sum(:time).sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
  end

  def show
    @user = User.find(current_user.id)
    @all_users = YTime.all.joins(:user).group(:user).sum(:time).sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
  end
end
