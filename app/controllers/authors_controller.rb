class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.create(params[:author])
    if Author.save
      redirect_to author_path
    else
      redirect_to articles
  end

  def update
    author = current_account.people.find(params[:id])
    author.update_attributes!(author_params)
    redirect_to @author
  end

  private

  def author_params
    params.require(:author).permit(:name, :avatar, :email)
  end

end
end
