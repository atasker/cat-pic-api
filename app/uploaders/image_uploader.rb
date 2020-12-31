class ImageUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "#{Rails.root}/uploads/#{Rails.env}/#{model.id}"
  end

  def extension_whitelist
    ["jpeg", "jpg", "png"]
  end

end
