class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :authorize_user

  # GET /user/preferences
  def preferences
    @user = current_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

end