class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    songs=self.songs.uniq! {|song| song[:artist_id]}
    songs.count
  end

  def all_artist_names
    self.artists.collect {|artist| artist.name}
  end
end
