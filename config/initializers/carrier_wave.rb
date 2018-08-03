if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAJF6LTMQCXGB3TRHA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['Jabberish']
  end
end
