class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    count = 0
    Song.all.each do |song|
      if song.genre == self
        count += 1
      end
    end
    count

  end

  def artist_count
    count = 0
    Song.all.each do |song|
      if song.genre == self
        Artist.all.each do |artist|
          if artist.id == song.artist_id
            count += 1
          end
        end
      end
    end
    count
  end

  def all_artist_names
    Artist.all.map do |artist|
      artist.name
    end
  end

  
end
