CarrierWave.configure do |config|
  if Rails.env.production?
    # config.fog_provider = 'fog/aws' # 這行會出問題，不要加                        
    config.fog_credentials = {
      provider:              'AWS',                        
      aws_access_key_id:     ENV["AWS_ID"],      # 你的 key           
      aws_secret_access_key: ENV["AWS_KEY"],      # 你的 secret key         
      region:                'Tokyo' # 你的 S3 bucket 的 Region 位置   
    }
    config.fog_directory  = 'pigoscar' # 你設定的 bucket name 
  else
    config.storage :file
  end
end