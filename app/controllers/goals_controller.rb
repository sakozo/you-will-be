class GoalsController < ApplicationController
  def index
  end

  def new
    @time = YTime.new()
  end
end
