
module Mover

    class Archiver
    
        Modules = {
            "filesystem" => Archivers::FileSystem
        }
    
        attr_accessor :path, :opts
    
        def initialize path, opts={}
            @path = path
            @opts = opts
        end
        
        def archive
        
            unless File.exists?(path)
                return Log.error "#{path} does not exist"
            end
            
            unless opts[:to]
                return Log.error "Archive destination not defined"
            end
 
            unless opts[:to] =~ /^(\w+):(.+)$/
                return Log.error "Invalid destination #{opts[:to]} ex: directory:/path/to/dir"
            end
            
            type = Regexp.last_match(1)
            data = Regexp.last_match(2)
            
            unless Modules.has_key?(type)
                return Log.error "Invalid archiver type #{type}"
            end
            
            extend Modules[type]
      
            begin
                process data
            rescue
                Log.error "Process method not defined by #{Modules[type]}"
            end
        end
        
        private
        
        def archive_name
            "#{File.basename(path)}.#{Time.now.strftime("%Y%j%H%M%S")}.tgz"
        end
    end

end
