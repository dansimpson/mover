module CloudSync

  class Log

    @threshhold = 1

    @descriptor = {
      1 => "DBUG",
      2 => "WARN",
      3 => "INFO",
      4 => "ERROR"
    }

    def self.debug msg
      log(msg,1) if @threshhold <= 1
    end

    def self.warning msg
      log(msg,2) if @threshhold <= 2
    end

    def self.info msg
      log(msg,3) if @threshhold <= 3
    end
    
    def self.error msg
      log(msg,4) if @threshhold <= 4
    end

    def self.debug!
      @threshhold = 1
    end

    def self.warn!
      @threshhold = 2
    end

    def self.info!
      @threshhold = 3
    end

    def self.shutthefuckup!
      @threshhold = 4
    end
    
    def self.is_debug?
        @threshhold == 1
    end

    private

    def self.log msg, level
        puts "[#{@descriptor[level]}] #{Time.now} - #{msg}"
    end

  end

end
