class GoalsController < ApplicationController
  def index
  end

  def show
    @goals = Goal.all
  end

  def new
    @goal = Goal.new()
    #binding.pry
  end

  def create
    
  end
end
