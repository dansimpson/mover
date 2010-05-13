
module Mover
    module Archivers
        module FileSystem
        
            def process destination
                filename = 
                unless File.exists?(destination)
                    Log.error "#{destination} does not exist" and return
                end
                Log.info "tar czvf #{[destination, filename].join('/')} #{path}"
            end

        end
    end
end
