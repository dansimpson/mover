$:.unshift File.dirname(__FILE__)

require "eventmachine"
require "fog"

module Mover

    VERSION = 0.1

    def self.schedule &block
        EM.run do
            Scheduler.new.instance_eval &block
            Log.info "Mover Started With Great Success"
        end
    end
    
    def self.test &block
        Action.new(block).execute
    end
end

require "core_ext/fixnum"

#archivers
require "mover/media/base"
require "mover/media/filesystem"
require "mover/media/ftp"
require "mover/media/rackspace"
require "mover/media/s3"

require "mover/resource"
require "mover/log"
require "mover/action"
require "mover/scheduler"
require "mover/archiver"
require "mover/synchronizer"

