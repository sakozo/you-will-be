class GoalsController < ApplicationController
  def index
  end

  def new
    @goals = Goal.all
    #binding.pry
  end
end
