class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  Rails.env.production? ? (storage :fog) : (storage :file)

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [100, nil]
  end

  def extension_whitelist
    %w[jpg png]
  end
end
