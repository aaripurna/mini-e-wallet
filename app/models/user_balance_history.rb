class UserBalanceHistory < ApplicationRecord
  belongs_to :user_balance
  enum transaction_type: {
    credit: 1,
    debit: 2
  }
end
