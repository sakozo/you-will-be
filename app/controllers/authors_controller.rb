class AuthorsController < ApplicationController
  def new
    @author = Author.new()
    @comments = Author.all
  end

  def create
    Author.create(comments_params)
  end

  def comments_params
    params.require(:author).permit(:comments)
  end
end
