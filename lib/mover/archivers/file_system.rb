
module Mover
    module Archivers
        module FileSystem
        
            def process destination
                unless File.exists?(destination)
                    return Log.error "#{destination} does not exist"
                end
                system "tar czvf #{[destination, archive_name].join('/')} #{path}"
            end

        end
    end
end
