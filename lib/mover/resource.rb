module Mover

    MediaTypes = {
        :filesystem => Mover::Media::Filesystem,
        :rackspace  => Mover::Media::Rackspace,
        :s3         => Mover::Media::S3,
        :ftp        => Mover::Media::FTP  
    }

    class Resource
    
        attr_accessor :medium, :path
    
        def initialize medium, path
            @medium = medium
            @path   = path
        end
        
        def is_object?
            @medium.is_object?(@path)
        end
        
        def is_container?
            @medium.is_container?(@path)
        end
        
        def store resource
            
        end
        
        def << resource 
            if is_container?
                @medium.store(medium.ostream(path), path)
            end
        end
        
        
        class << self
        
            def parse resource
                raise "Invalid resource value #{val}" unless resource =~ /\w+:/
                
                medium, path = resource.split(":")
                medium = resolve_medium medium.to_sym
                
                Resource.new medium, path
            end
            
            def resolve_medium medium
                unless MediaTypes.has_key?(medium)
                end
                MediaTypes[medium].new
            end
            
        end
        
    end
    
end
