CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:access_key],
      region: Rails.application.credentials.aws[:region],
      path_style: true
    }
    config.storage = :fog
    config.fog_directory = Rails.application.credentials.aws[:bucket]
  else
    config.storage = :file
  end
end
