class Client < ApplicationRecord
  has_many :packs
  validates :name, :address, :phone_number, presence: true
  validates :phone_number, format: { with: /(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}$/, multiline: true }
end
