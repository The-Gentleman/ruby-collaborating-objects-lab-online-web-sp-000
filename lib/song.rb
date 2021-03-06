require 'pry'
class Song
    @@all = []
    attr_accessor :name, :artist

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def self.new_by_filename(file)
        artist = file.split(' - ')[0]
        song_name = file.split(' - ')[1]
        file_extension = file.split(' - ')[2]
        
        song = Song.new(song_name)
        song.artist_name = artist
        # binding.pry
        song 
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end 