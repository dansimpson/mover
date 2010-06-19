module CloudSync
    module Media
        class S3 < Base
          
          def initialize
            raise "s3_access_key not set" unless Configuration.s3_access_key
            raise "s3_secret_key not set" unless Configuration.s3_secret_key
            
            AWS::S3::Base.establish_connection!({
              :access_key_id     => Configuration.s3_access_key, 
              :secret_access_key => Configuration.s3_secret_key
            })
          end
          
          def exists? path
            bucket, object = parse path
            object_exists?(bucket, object)
          end

          def reader path
            bucket, object = parse path
            get_object(bucket, object)
          end

          def writer path
            bucket, object = parse path
            get_object(bucket, object)
          end

          protected

          def parse path
            parts = path.split "/"
            bucket = parts.shift
            [bucket, parts.join("/")]
          end

          def bucket_exists? bucket
            AWS::S3::Bucket.find(bucket) rescue false
          end

          def object_exists? bucket, object
            AWS::S3::S3Object.exists?(object, bucket)
          end

          def get_bucket bucket
            unless bucket_exists?(bucket)
              AWS::S3::Bucket.create(bucket)
            end
            AWS::S3::Bucket.find(bucket)
          end

          def get_object bucket, object
            object_exists?(bucket, object) ? AWS::S3::S3Object.find(object, bucket) : nil
          end
          
          
        end
    end     
end
