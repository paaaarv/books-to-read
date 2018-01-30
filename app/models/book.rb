class Book < ActiveRecord::Base
  belongs_to :user
  has_many :book_genres
  has_many :genres, through: :book_genres
end
