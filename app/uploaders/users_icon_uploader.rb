class UsersIconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("/images/fallback/" + [thumb, "default_icon.png"].compact.join('_'))
  end
end
