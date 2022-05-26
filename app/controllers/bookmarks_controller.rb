class BookmarksController < ApplicationController
  before_action :set_list, only: [:show, :new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    # raise
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save!
      redirect_to list_path(@list), notice: "Bookmark added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy

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
