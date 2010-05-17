module Mover
    class Archiver
    
        attr_accessor :source, :destination
    
        def initialize source, destination
            @source       = Resource.parse source
            @destination  = Resource.parse destination
            @archive_name = archive_name
        end
        
        def archive
        
            unless source
                return Log.error "Invalid syntax for resource #{source}"
            end
            
            unless destination
                return Log.error "Invalid syntax for resource #{destination}"
            end


            if source.medium.respond_to?(:archive)

                tar = Resource.new(@source.medium, archname)
                
                system "tar czvf #{archname} #{source.path}"
                destination.istream("/home/dan/moo.tgz") << tar.ostream
                system "rm #{archname}"
                
                
                
            else
                Log.error "You cannot archive a container or object for medium #{source.medium}"
            end

        end
        
        protected
        
        def archive_name
            "#{File.basename(source.path)}.#{Time.now.strftime("%Y%j%H%M%S")}.tgz"
        end
        
    end
end
