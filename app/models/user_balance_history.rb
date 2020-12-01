class UserBalanceHistory < ApplicationRecord
  belongs_to :user_balance
  enum transaction_type: {
    credit: 1,
    debit: 2
  }

  validates_numericality_of :balance_after, greater_than_or_equal_to: 0
end
