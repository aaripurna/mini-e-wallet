class UserBalance < ApplicationRecord
  belongs_to :user
  has_one :user_balance_history, dependent: :destroy
  validates_numericality_of :balance, greater_than_or_equal_to: 0
end
