class BalancesController < ApplicationController
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

  private

  def balance_params
    params.require(:balance).permit(:amount, :author, :location, :receiver_id)
  end
end
