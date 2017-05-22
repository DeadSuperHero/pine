CarrierWave.configure do |config|

  # Choose what kind of storage to use for this uploader:

  if Rails.env.development? || Rails.env.test?
      config.storage = :file
    else

  config.storage = :aws
  config.aws_bucket = ENV["S3_BUCKET_NAME"]
  config.aws_acl   = "public-read"

  config.aws_credentials = {
    access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
    secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region:            ENV["AWS_REGION"]

  }
  end
end
