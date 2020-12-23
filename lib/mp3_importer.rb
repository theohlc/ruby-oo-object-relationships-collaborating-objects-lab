require 'pry'

class MP3Importer
    attr_accessor :filename, :path

    #files = []

    def initialize(path)
        @path = path
    end

    def files
        #binding.pry
        Dir.entries(path).select { |f| File.file? File.join(path, f) }
    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end
end