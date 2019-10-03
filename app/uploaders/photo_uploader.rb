require 'mini_magick'
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick
  process resize_to_fill: [254, 200]
end
