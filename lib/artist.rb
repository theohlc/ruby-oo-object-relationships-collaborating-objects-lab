class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name= name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def add_song_by_name(name)
        song = Song.new(name)
        song.artist = self
    end

    def self.create_by_name(name)
        artist = self.new(name)
    end

    def self.find_by_name(name)
        @@all.find do |artist|
          name == artist.name
        end
    end

    def self.find_or_create_by_name(name)
        artist = find_by_name(name)
        #binding.pry
        if artist
            #binding.pry
            artist
        else
            #binding.pry
            create_by_name(name)
        end
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end
end