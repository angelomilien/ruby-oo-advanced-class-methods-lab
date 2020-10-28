require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |i| i.name == name }
  end

  def self.find_or_create_by_name(title_song)
    self.create_by_name(title_song) if self.all.include?(self.find_by_name(title_song)) == false
    self.find_by_name(title_song) 
  end

  def self.alphabetical
    self.all.sort_by { |ele| ele.name }
  end

  def self.new_from_filename(file_name)     
    data_array = file_name.split(/[-.]/)
    song = self.new
    song.name = data_array[1].strip
    song.artist_name = data_array[0].strip
    song
  end


  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    self.all.clear
  end
end
