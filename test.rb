require "lib/mover.rb"

Mover.test do
    archive "/home/dan/test", :to => "filesystem:/home/dan"
end

#Mover.schedule do
#
#    every 1.seconds do
#        archive "/home/dan/test", :to => "filesystem:/home/dan"
#    end

#end


