class User < ApplicationRecord

  has_many :wishlist_items

  normalizes :first_name, :last_name, with: -> attr { attr.strip }

  validates :first_name,
    presence: true,
    length: { minimum: 3, maximum: 25 },
    format: { with: /\A[a-zA-Z']+[\s\-]?[a-zA-Z]+\z/, message: "only letters, apostrophes, and single blank spaces are allowed in first names" }
  validates :last_name,
    presence: true,
    length: { minimum: 3, maximum: 25 },
    format: { with: /\A[a-zA-Z']+[\s\-]?[a-zA-Z]+\z/, message: "only letters, apostrophes, and a single blank space or a hyphen are allowed in last names" }
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
end
