
module Mover

    class Action
    
        attr_accessor :timer, :callback, :busy
    
        def initialize cb
            @callback = cb
        end
    
    
        def synchronize dir, opts
            Log.debug "syncrhonize #{dir}"
        end


        def archive path, opts={}
            Archiver.new(path, opts).archive
        end
        
        
        def backup dir, opts
            raise "No destination defined" unless opts[:to] || opts[:from]
            Log.debug "backup #{dir}"
        end
        
        
        def execute
        
            return if busy
            
            #begin
                busy = true
                instance_eval &callback
            #rescue Exception => ex
            #    Log.error ex
            #end
            
            busy = false
        end
    
    end

end
