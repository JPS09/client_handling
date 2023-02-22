class Pack < ApplicationRecord
  belongs_to :type
  belongs_to :client
  validates :type_id, :client_id, :is_valid, :remaining_hours, presence: true
end
