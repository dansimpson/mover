module CloudSync

  class Configuration 

    @map = {
    }

    def self.get key
      @map[key.to_sym]
    end

    def self.put key, val
      @map[key.to_sym] = val
    end

    def self.method_missing method, *args
      if method.to_s =~ /=$/
        return put method.to_s.chop, args.first
      else
        return get method
      end
      super
    end
    
    def self.load file
      begin
        configure YAML.load_file(file)
      rescue
        raise IOError, "#{file} could not be loaded."
      end
    end
    
    def self.configure map
      map.each do |k,v|
        put k, v
      end
    end

  end

end