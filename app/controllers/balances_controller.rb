class BalancesController < ApplicationController
  def topup
    service = TopupService.execute(user: current_user, ip: request.remote_ip, **balance_params.to_h.symbolize_keys)
    if service.errors.blank?
      return head :ok
    end

    render json: { errors: service.errors }, status: 422
  end

  private

  def balance_params
    params.require(:balance).permit(:amount, :activity, :author, :location)
  end
end
