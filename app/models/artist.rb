require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    genre = Genre.find_by_id(self.songs[0].genre_id)

  end

  def song_count
    #return the number of songs associated with the artist
    # binding.pry
    self.songs.count
  end

  def genre_count
    #return the number of genres associated with the artist
    self.songs.each_with_object(genres=[]) do |x|
     genres << x.genre_id unless genres.include?(x.genre_id)
   end.count
  end
end
