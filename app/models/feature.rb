class Feature < ApplicationRecord
  belongs_to :pack
  belongs_to :status
  validates :status_id, :pack_id, :cost, :description, presence: true
  validates :cost, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 5 }
end
