class Pack < ApplicationRecord
  belongs_to :type
  belongs_to :client
  has_many :features
  validates :type_id, :client_id, :is_valid, :remaining_hours, presence: true
end
