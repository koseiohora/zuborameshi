class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  def like_user(user_id)
    # binding.pry
    likes.find_by(user_id: user_id)
  end
  # attr_accessor :image_first
  mount_uploader :image, ImageUploader
end

