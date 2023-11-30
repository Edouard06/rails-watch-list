class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  before_destroy :destroy_child_saved_movies
  private
  def destroy_child_saved_movies
    movies.destroy_all
  end
end
