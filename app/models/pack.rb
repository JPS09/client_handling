class Pack < ApplicationRecord
  belongs_to :type
  belongs_to :client
end
