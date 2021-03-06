class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    #instance method - self is the instance
  end

  def self.create
    song = Song.new
    song.save
    song
  end 

  def self.new_by_name(name)
    song = Song.new
    song.name = name 
    song
  end 

  def self.create_by_name(name)
    song = Song.create
    song.name = name 
    song
  end 

  def self.find_by_name(name)
    self.all.find do |track| 
      track.name == name 
    end 
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    
  end 
  
 

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end 

  def self.new_from_filename(filename)

    separate = filename.split(" - ")
    artist_name = separate[0]
    song_name = separate[1].gsub(".mp3","")
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song

  end 

  def self.create_from_filename(filename)
    separate = filename.split(" - ")
    artist_name = separate[0]
    song_name = separate[1].gsub(".mp3","")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song

  end

  def self.destroy_all
    @@all.clear
  end 
end
