class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie, foreign_key: "movie_id"
  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, length: { minimum: 6 }
end
