module CloudSync
  module Media
    class Filesystem < Base

      def exists? path
        File.exists? path
      end
      
      def is_container? path
        File.directory? path
      end

      def is_object? path
        File.exists? path
      end
          
      def reader path
        File.open(path, "r")
      end

      def writer path
        File.open(path, "w")
      end

    end
  end     
end
