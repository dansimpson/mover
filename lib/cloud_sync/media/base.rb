module CloudSync
  module Media
    class Base

      def exists? path
        raise "#{self.class}.exists? not implemented"
      end
      
      def writer path
        raise "#{self.class}.writer not implemented"
      end

      def reader path
        raise "#{self.class}.reader not implemented"
      end

    end
  end
end
