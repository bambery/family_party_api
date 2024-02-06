class WishlistItem < ApplicationRecord
  belongs_to :user

  normalizes :name, :description, with: -> attr { attr.strip }

  validates :name,
    presence: true,
    length: { minimum: 3 }
end
