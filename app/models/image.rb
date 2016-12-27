class Image < ActiveRecord::Base
  # attr_accessible :imagename
  mount_uploader :imagename, ImageUploader
end
