class MoviesController < ApplicationController
  before_action :set_movie, only: ["show"]

  def show
    @lists = @movie.lists
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
