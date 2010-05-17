require "lib/mover.rb"

Mover.test do
    archive "filesystem:/home/dan/test", "filesystem:/home/dan"
    archive "filesystem:/home/dan/test", "rackspace:mover"
end

#Mover.schedule do
#
#    every 1.seconds do
#        archive "/home/dan/test", :to => "filesystem:/home/dan"
#    end

#end


