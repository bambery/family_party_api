class RemoveLinkFromWishlistItem < ActiveRecord::Migration[7.1]
  def change
    remove_column :wishlist_items, :link, :string
  end
end
