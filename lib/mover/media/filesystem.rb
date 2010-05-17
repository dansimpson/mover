module Mover
    module Media
        class Filesystem
        
        
            def archive 
            end
            
            def is_container? path
                File.directory? path
            end
            
            def ostream path
                File.open(path, "r")
            end
            
            def store stream, path
                File.new(path, "w") << stream
            end

        end
    end     
end
