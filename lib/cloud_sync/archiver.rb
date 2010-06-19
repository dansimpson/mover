module CloudSync
  class Archiver

    attr_accessor :source, :destination

    def initialize source, destination
      @source       = Resource.new source
      @destination  = Resource.new destination
    end

    def archive

      unless source
        return Log.error "Invalid syntax for resource #{source}"
      end

      unless destination
        return Log.error "Invalid syntax for resource #{destination}"
      end

      tar = Resource.new("filesystem:#{archive_path}")
      system "tar czvf #{archive_path} #{source.path}"
      destination.istream("/home/dan/moo.tgz") << tar.ostream
      system "rm #{archive_path}"

    end

    protected

    def archive_path
      "/tmp/#{archive_name}"
    end

    def archive_name
      @archive_name ||= "#{File.basename(source.path)}.#{Time.now.strftime("%Y%j%H%M%S")}.tgz"
    end

  end
end
