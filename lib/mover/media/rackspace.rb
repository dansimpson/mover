module Mover
    module Media
        class Rackspace
        
            def initialize user, pass
                @conn = CloudFiles::Connection.new(:username => user, :api_key => pass)
            end
            
            def is_container? container
                @conn.container_exists?(container)
            end
            
            def list container
                @conn.container(container).objects
            end
            
            def create container
                begin
                    @conn.create_container container
                rescue Exception => ex
                    Log.error ex
                end
            end
                        
            def ostream obj
                File.open(obj, "r")
            end
            
            def istream obj
                File.new(obj, "w")
            end
            
        end
    end     
end
