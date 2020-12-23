class Song
    attr_accessor :artist, :name, :genre

    @@all = []

    def initialize(name)
        @name = name
        #@genre = genre
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.create_by_name(name)
        song = self.new(name)
    end
    
    def self.find_by_name(name)
        @@all.find do |song|
          name == song.name
        end
    end

    def self.find_or_create_by_name(name)
        song = find_by_name(name)
        if song
          song
        else
          create_by_name(name)
        end
        #binding.pry
      end

    def artist_name=(name)
        #binding.pry
        self.artist = Artist.find_or_create_by_name(name)
        name
    end

    def artist_name
        if self.artist == nil
            nil
        else 
            self.artist.name
        end
    end

    def self.new_by_filename(filename)
        name_array = filename.split(/[-.]/)
        
        song = self.new(name_array[1].strip)
        #binding.pry
        song.artist = Artist.find_or_create_by_name(name_array[0].strip)
        #binding.pry
        song
    end
end