module CloudSync

  MediaTypes = {
    :filesystem => CloudSync::Media::Filesystem,
    :rackspace  => CloudSync::Media::Rackspace,
    :s3         => CloudSync::Media::S3 
  }

  class Resource

    attr_accessor :medium, :path, :type, :uri

    def initialize uri
      raise "Invalid resource string #{uri}" unless uri =~ /\w+:/
      
      @uri = uri
      @type, @path = uri.split(":")
      @type = @type.to_sym
      
      raise "Invalid medium type: #{@type}" unless MediaTypes.has_key?(@type)
        
      @medium = MediaTypes[@type].new
    end

    def exists?
      @medium.exists?(@path)
    end

    def copy to
      
      raise "Resource #{@uri} does not exist" unless exists?

      input  = reader
      output = to.writer
      output.write(input.read)
      
      input.close if input.respond_to? :close
      output.close if output.respond_to? :close
    end
  
    def writer
      @medium.writer @path
    end

    def reader
      @medium.reader @path
    end

  end 
end
