# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # thumb バージョン(width 400px x height 200px)
  version :thumb do
    process :resize_to_fit => [400, 200]
  end

  # 許可する画像の拡張子
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # 変換したファイルのファイル名の規則
  def filename
    "#{Time.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  end

end
