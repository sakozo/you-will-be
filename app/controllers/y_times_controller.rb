class YTimesController < ApplicationController
  def new
    @time = YTime.new()
  end

  def create
    redirect_to y_times_path
  end
end
