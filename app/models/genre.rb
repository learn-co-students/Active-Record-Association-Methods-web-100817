require 'pry'

class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    #binding.pry
    Song.where("genre_id = #{self.id}").count
    # return the number of songs in a genre
  end

  def artist_count
    #binding.pry
    Song.where("genre_id = #{self.id}").count(:artist_id)
    # return the number of artists associated with the genre
  end

  def all_artist_names
    Artist.all.map {|artist| artist.name}
    # return an array of strings containing every musician's name
  end
end
