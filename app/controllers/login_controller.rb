class LoginController < ApplicationController
  skip_before_action :authenticate_request
  def sign_in
    api_request  = AuthenticateUser.new(params[:email], params[:password]).call
    if token = api_request.result
      render json: { token: token }, status: :ok
    else
      render json: {},status: :unauthorized
    end
  end
  
end
