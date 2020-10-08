class Friendlist < ApplicationRecord
  belongs_to :user
  enum status: %i[send_request accepted_request cancel_request]
end
