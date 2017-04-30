class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)
    @author.save
  end

  def author_params
    params.require(:author).permit(:email, :name, {avatar: []})
  end
end
