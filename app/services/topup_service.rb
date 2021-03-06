class TopupService < ApplicationService
  attr_accessor :user, :amount, :activity, :ip, :location, :user_agent, :author
  def execute
    last_balace = user.user_balances.where(balance_achive: nil).last
    if amount < 1
      @errors.add(:base, :greater_than, count: 0)
    end

    return if @errors.any?
    UserBalance.transaction do
      if last_balace.present?
        last_balace.with_lock do
          create_balance(last_balace)
          return
        end
      end
      create_balance(last_balace)
    end
  end

  private

  def create_balance(last_balace)
    balance = user.user_balances.new(balance: amount)
    balance.save!
    history = balance.build_user_balance_history({
      balance_before: last_balace&.user_balance_history&.balance_after.to_i,
      balance_after: last_balace&.user_balance_history&.balance_after.to_i + amount,
      transaction_type: :debit,
      activity: 'Topup',
      ip: ip,
      location: location,
      user_agent: user_agent,
      author: author
    })
    history.save!
    if last_balace.present?
      last_balace.balance_achive = balance.id
      last_balace.save!
    end

    last_balance_bank = BalanceBank.last
    balance_bank = BalanceBank.new(balance: amount, code: 'Topup', balance_achive: balance.id)
    balance_bank.save!
    if last_balance_bank.present?
      last_balance_bank.with_lock do
        create_balance_bank_history balance_bank, last_balance_bank
        return
      end
    end

    create_balance_bank_history balance_bank, last_balance_bank
  end

  def create_balance_bank_history(balance_bank, last_balance_bank)
    balance = last_balance_bank&.balance_bank_history&.balance_after.to_i
    balance_bank_history = balance_bank.build_balance_bank_history({
      balance_before: balance,
      balance_after: balance - amount,
      transaction_type: :credit,
      activity: 'Topup',
      ip: ip,
      location: location,
      user_agent: user_agent,
      author: author
    })
    balance_bank_history.save!
  end
end
