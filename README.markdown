

##The Idea...

    Mover.schedule do
        every 12.hours do
           archive "/home/user/documents", :to => "filesystem:/mnt/external/snapshots"
        end
        
        every 30.minutes do
           system "mysqldump mydb -u special > /tmp/dump.sql"
           archive "/tmp/dump.sql", :to => "filesystem:/backups/sql/mydb"
           archive "/tmp/dump.sql", :to => "s3:/backups/mydb"
        end
        
        every 5.minutes do
            synchronize "/some/directory", :with => "remote:special", :target => "/other/path"
        end
        
        on_change "/some/dir" do
            # ...
        end
    end
