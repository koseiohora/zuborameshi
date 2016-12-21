class Like < ActiveRecord::Base
  belongs_to :recipe, counter_cache: :likes_count
  belongs_to :user
end
