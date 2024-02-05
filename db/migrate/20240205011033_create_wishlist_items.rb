class CreateWishlistItems < ActiveRecord::Migration[7.1]
  def change
    create_table :wishlist_items do |t|
      t.string :name
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
