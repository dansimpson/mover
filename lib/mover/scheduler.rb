module Mover

    class Scheduler
    
        attr_accessor :actions
    
        def initialize
            @actions = []
        end
    
        def every duration, opts={}, &block
            action = Action.new(block)
            action.timer = EM.add_periodic_timer(duration) do
                action.execute
            end
            actions << action
        end
        
    end
    
end
