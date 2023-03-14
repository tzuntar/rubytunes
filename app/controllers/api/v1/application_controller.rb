class Api::V1::ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_api_user

  private

  def authenticate_request
    @current_api_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Unauthorized request.' },
           status: :unauthorized unless @current_api_user
  end
end