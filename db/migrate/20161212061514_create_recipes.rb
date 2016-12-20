class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :image
      t.text :text
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
