CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "bobo"
  config.upyun_password = 'bobo1234'
  config.upyun_bucket = "image2-upyun-com"
  # upyun_bucket_domain 以后将会弃用，请改用 upyun_bucket_host
  # config.upyun_bucket_domain = "my_bucket.files.example.com"
  config.upyun_bucket_host = "http://image2-upyun-com.test.upcdn.net"
end
