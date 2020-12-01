class TransferService < ApplicationService
  attr_accessor :sender, :receiver, :amount, :ip, :location, :user_agent, :author, :receiver_id
  def execute
    if sender.id == receiver.id
      @errors.add(:base, "can't transfer to own account")
    end

    if amount < 1
      @errors.add(:base, :greater_than, count: 0)
    end
    sender_last_balance = sender.user_balances.where(balance_achive: nil).last
    receiver_last_balance = receiver.user_balances.where(balance_achive: nil).last

    if sender_last_balance.blank?
      @errors.add(:base, 'Balance insufficient')
    end

    if sender_last_balance.present? && sender_last_balance.user_balance_history.balance_after < amount
      @errors.add(:base, 'Balance insufficient')
    end

    return if @errors.present?

    UserBalance.transaction do
      sender_last_balance.with_lock do
        create_sender_balance(sender_last_balance)

        if receiver_last_balance.blank?
          create_receiver_balance(receiver_last_balance)
          return
        end

        receiver_last_balance.with_lock do
          create_receiver_balance(receiver_last_balance)
        end
      end
    end
  end

  private

  def create_sender_balance(sender_last_balance)
     # SENDER
     sender_balance = sender.user_balances.new(balance: amount)
     sender_balance.save!
     sender_history = sender_balance.build_user_balance_history({
       balance_before: sender_last_balance.user_balance_history.balance_after.to_i,
       balance_after: sender_last_balance.user_balance_history.balance_after.to_i - amount,
       transaction_type: :credit,
       activity: "Transfer to #{receiver.email}",
       ip: ip,
       location: location,
       user_agent: user_agent,
       author: author
     })
     sender_history.save!
  end

  def create_receiver_balance(receiver_last_balance)
    # RECEIVER
    receiver_balance = receiver.user_balances.new(balance: amount)
    receiver_balance.save!
    receiver_history = receiver_balance.build_user_balance_history({
      balance_before: receiver_last_balance&.user_balance_history&.balance_after.to_i,
      balance_after: receiver_last_balance&.user_balance_history&.balance_after.to_i + amount,
      transaction_type: :debit,
      activity: "Transfer from #{sender.email}",
      ip: ip,
      location: location,
      user_agent: user_agent,
      author: author
    })
    receiver_history.save!
  end
end
