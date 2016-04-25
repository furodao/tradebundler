CarrierWave.configure do |config|
  #config.fog_credentials = {
  #  :provider              => 'fog-aws',
  #  :aws_access_key_id     => ENV['S3_KEY'],
  #  :aws_secret_access_key => ENV['S3_SECRET'],
  #  :region                => ENV['S3_REGION']
  #}

  config.storage    = :aws,
  config.aws_bucket = ENV['S3_BUCKET'],
  config.aws_acl    = 'public-read',

  config.aws_credentials = {
    access_key_id:     ENV.fetch('S3_KEY'),
    secret_access_key: ENV.fetch('S3_SECRET'),
    region:            ENV.fetch('S3_REGION')
  }


  # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :aws
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku

  #config.fog_directory    = ENV['S3_BUCKET']
  #config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  #config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET']}"
end
