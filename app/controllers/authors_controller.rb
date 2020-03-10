class AuthorsController < ApplicationController
  def new
    @author = Author.new()
    @comments = Author.all

    #binding.pry
  end

  def create
    Author.create(comments_params)
    redirect_to new_author_path
  end

  def comments_params
    params.require(:author).permit(:comments, :name)
  end
end
