class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:login], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  def logout
    auth_token = AuthorizeApiRequest.new(request.headers)
    if auth_token.call[:user].present?
      blacklisted_token = BlacklistedToken.find_or_initialize_by(token: request.headers['Authorization'])
      blacklisted_token.save
    end
  end

  private

  def auth_params
    params.permit(:login, :password)
  end
end
