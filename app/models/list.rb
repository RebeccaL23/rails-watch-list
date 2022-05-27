class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo
  validates :name, uniqueness: true, presence: true

  def other_movies
    Movie.where.not(id: movies.map(&:id))
  end
end
