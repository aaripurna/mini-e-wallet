json.data do
  json.array! @histories, :id, :user_balance_id, :balance_before,
                          :balance_after, :activity, :transaction_type,
                          :ip, :location, :user_agent, :author, :created_at, :updated_at
end
