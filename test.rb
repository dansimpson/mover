require "lib/cloud_sync.rb"

CloudSync::Configuration.configure({
  :rackspace_user => "simpsond",
  :rackspace_key  => "1e2a5914dfe7f13e46210bf8b5f3efb4",
  :s3_access_key  => "1HN2QNFSZ3QEHW7AQ982",
  :s3_secret_key  => "GxjyJyBoPcwji8cKFHVuZtBC4G2d0z81NLA8lZNy"
})

CloudSync.copy "s3:/ds-backups/backup/taxes/2008/IMG_0396.JPG", "filesystem:/Users/Dan/check.jpg"

#CloudSync.copy "filesystem:/Users/Dan/moo.txt", "rackspace:cloud_sync/moo.txt"
#CloudSync.copy "rackspace:cloud_sync/moo.txt", "filesystem:/Users/Dan/moo2.txt"

#CloudSync.copy "rackspace:cloud_sync/moo.txt", "rackspace:cloud_sync/moo2.txt"
