class Like < ActiveRecord::Base
  belongs_to :recipe, count_cache: :likes_count
  belongs_to :user
end
