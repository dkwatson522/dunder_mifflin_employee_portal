Cloudinary.config do |config|
  config.cloud_name = Rails.application.credentials[:cloudinary][:development][:cloud_name]
  config.api_key = Rails.application.credentials[:cloudinary][:development][:api_key]
  config.api_secret = Rails.application.credentials[:cloudinary][:development][:api_secret]
  config.secure = true
  config.cdn_subdomain = true
end

Cloudinary.config do |config|
  config.cloud_name = Rails.application.credentials[:cloudinary][:production][:cloud_name]
  config.api_key = Rails.application.credentials[:cloudinary][:production][:api_key]
  config.api_secret = Rails.application.credentials[:cloudinary][:production][:api_secret]
  config.secure = true
  config.cdn_subdomain = true
end
