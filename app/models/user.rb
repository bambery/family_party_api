class User < ApplicationRecord

  normalizes :first_name, :last_name, with: -> attr { attr.strip }

  validates :first_name,
    presence: true,
    length: { minimum: 3, maximum: 25 },
    format: { with: /\A[a-zA-Z']+\s?[a-zA-Z]+\z/, message: "only letters, apostrophes, and single blank spaces are allowed in names" }
  validates :last_name,
    presence: true,
    length: { minimum: 3, maximum: 25 },
    format: { with: /\A[a-zA-Z']+\s?[a-zA-Z]+\z/, message: "only letters, apostrophes, and single blank spaces are allowed in names" }

end
