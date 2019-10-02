class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  version :resized do
    # returns an image with a maximum width of 100px
    # while maintaining the aspect ratio
    # 10000 is used to tell CW that the height is free
    # and so that it will hit the 100 px width first
    process resize_to_fit: [254, 200]
  end
end
