class BalancesController < ApplicationController
  def index
    @balance = current_user.user_balances.includes(:user_balance_history).last
  end

  def topup
    service = TopupService.execute(user: current_user, ip: request.remote_ip, **balance_params.to_h.symbolize_keys)
    if service.errors.blank?
      return head :ok
    end

    render json: { errors: service.errors }, status: 422
  end

  def transfer
    service = TransferService.execute(sender: current_user, receiver: User.find(balance_params[:receiver_id]), ip: request.remote_ip, **balance_params.to_h.symbolize_keys)
    if service.errors.blank?
      return head :ok
    end

    render json: { errors: service.errors }, status: 422
  end

  def histories
    @histories = current_user.user_balance_histories.order(id: :desc)
  end

  private

  def balance_params
    params.require(:balance).permit(:amount, :author, :location, :receiver_id)
  end
end
