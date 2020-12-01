json.data do
  json.current_balance @balance&.user_balance_history&.balance_after.to_i
end
