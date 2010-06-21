require "lib/cloud_sync.rb"

CloudSync::Configuration.load("../../config.yaml")

CloudSync.copy "s3:/ds-backups/backup/taxes/2008/IMG_0396.JPG", "filesystem:/Users/Dan/check.jpg"

#CloudSync.copy "filesystem:/Users/Dan/moo.txt", "rackspace:cloud_sync/moo.txt"
#CloudSync.copy "rackspace:cloud_sync/moo.txt", "filesystem:/Users/Dan/moo2.txt"

#CloudSync.copy "rackspace:cloud_sync/moo.txt", "rackspace:cloud_sync/moo2.txt"
