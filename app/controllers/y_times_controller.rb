class YTimesController < ApplicationController

  def index
    @user = User.find(current_user.id)
  end

  def new
    @time = YTime.new()
  end

  def create
    redirect_to user_index_path
  end

  def show
    
  end
end
