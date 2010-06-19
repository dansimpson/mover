$:.unshift File.dirname(__FILE__)

require "rubygems"
require "cloudfiles"
require "aws/s3"
require "pp"

module CloudSync
  
  VERSION = 0.1

  def self.copy source, destination
    Resource.new(source).copy(Resource.new(destination))
  end
  
  def self.archive source, destination
    Archiver.new(source, destination).archive
  end
  
  def self.synchronize source, destination
    Synchronizer.new(source).synchronize(destination)
  end
  
end

#archivers
require "cloud_sync/configuration"
require "cloud_sync/media/base"
require "cloud_sync/media/filesystem"
require "cloud_sync/media/rackspace"
require "cloud_sync/media/s3"
require "cloud_sync/resource"
require "cloud_sync/log"
require "cloud_sync/archiver"
require "cloud_sync/synchronizer"

