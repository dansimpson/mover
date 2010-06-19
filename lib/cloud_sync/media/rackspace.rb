module CloudFiles
  class StorageObject
    def read
      data
    end
  end
end

module CloudSync
  module Media
    class Rackspace < Base

      def initialize
        raise "rackspace_user not set" unless Configuration.rackspace_user
        raise "rackspace_key not set"  unless Configuration.rackspace_key
        @conn = CloudFiles::Connection.new(Configuration.rackspace_user, Configuration.rackspace_key)
      end
      
      def list container
        @conn.container(container).objects
      end
      
      def exists? path
        container, object = parse path
        object_exists?(container, object)
      end
        
      def reader path
        container, object = parse path
        get_object(container, object)
      end

      def writer path
        container, object = parse path
        get_object(container, object)
      end
      
      protected
      
      def parse path
        parts = path.split "/"
        container = parts.shift
        [container, parts.join("/")]
      end
      
      def container_exists? container
        @conn.container_exists?(container)
      end

      def object_exists? container, object
        container_exists?(container) && @conn.container(container).object_exists?(object)
      end
      
      def get_container container
        container_exists?(container) ? @conn.container(container) : @conn.create_container(container)
      end
      
      def get_object container, object
        tmp = get_container(container)
        tmp.object_exists?(object) ? tmp.object(object) : tmp.create_object(object, true)
      end

    end
  end     
end
