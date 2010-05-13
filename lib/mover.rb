$:.unshift File.dirname(__FILE__)

require "eventmachine"
require "fog"

module Mover
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
require "mover/log"
require "mover/action"
require "mover/scheduler"

require "mover/archivers/file_system"
require "mover/archiver"


