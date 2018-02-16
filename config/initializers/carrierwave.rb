CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     Rails.application.secrets.aws_access_key_id,                        # required
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,                        # required
    region:                'eu-central-1',                # optional, defaults to 'us-east-1'
    endpoint: 'https://s3.eu-central-1.amazonaws.com'
  }
  config.fog_directory  = 'professors-photos'                                   # required
  # config.fog_public     = false
  # config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }

  # For Heroku
  # config.cache_dir = "#{Rails.root}/tmp/uploads"

end
