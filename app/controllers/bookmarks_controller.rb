class BookmarksController < ApplicationController
  before_action :set_list, only: [:show, :new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    # raise
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.list = @list
    # raise
    if @bookmark.save!
      redirect_to list_path(@list), notice: "Bookmark added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @bookmark = Bookmark.find(params[:id])
    # @bookmark.destroy
    # # No need for app/views/restaurants/destroy.html.erb
    # redirect_to list_path(@list), status: :see_other # give HTTP status to indicate that the index page is provided with the other resources (minus the removed one)
  end

  def show
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
