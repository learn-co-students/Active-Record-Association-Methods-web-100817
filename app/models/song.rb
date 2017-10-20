require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def drake_made_this
     self.artist = Artist.new(name: "Drake") 

  end

  def get_genre_name
    Genre.all.map do |genre|
      if genre.id == genre_id
        return genre.name
      end
    end
  end


end
