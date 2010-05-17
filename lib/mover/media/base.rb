module Mover
    module Media
        class Base
        

            def create_container path
                raise "Relative paths not allowed" unless path =~ /^[\/|~]/
                File.mkdir_p(path)
            end

            def is_container? path
            end
                        
            def is_object? path
            end
           
            def << resource
                
                #resource.medium
                #resource.path
                
                #resource.get_bytes
                
                #write_bytes resouce.get_bytes
            end
            
            
            def write_bytes
            end
            
        end
    end
end
