class BalanceBank < ApplicationRecord
  has_one :balance_bank_history, dependent: :destroy
  validates_numericality_of :balance, greater_than_or_equal_to: 0
end
