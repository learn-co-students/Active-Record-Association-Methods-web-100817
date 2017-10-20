class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    #return the genre of the artist's first saved song
    Song.all.each do |song|
      if song.artist_id == self.id
        Genre.all.each do |genre|
          return genre if genre.id == song.artist_id
        end
      end
    end
  end

  def song_count
    count = 0
    Song.all.map do |song|
      if song.artist == self
        count +=1
      end
    end
    count
  end

  def genre_count
    count = 0
    Song.all.each do |song|
      if song.artist == self
        Genre.all.each do |genre|
          if genre.id == song.genre_id
            count += 1
          end
        end
      end
    end
      count
  end



end
