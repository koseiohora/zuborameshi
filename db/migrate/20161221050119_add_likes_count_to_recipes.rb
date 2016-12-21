class AddLikesCountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :likes_count, :integer
  end
end
