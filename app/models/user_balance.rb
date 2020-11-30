class UserBalance < ApplicationRecord
  belongs_to :user
  has_one :user_balance_history
end
