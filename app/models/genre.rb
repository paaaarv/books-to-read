require 'pry'
class Genre < ActiveRecord::Base
  has_many :book_genres
  has_many :books, through: :book_genres

  def self.user_genres(user)
    array = []
    user.books.each do |book|
      book.genres.each do |genre|
        array << genre
      end
    end
    array.uniq
  end
end
