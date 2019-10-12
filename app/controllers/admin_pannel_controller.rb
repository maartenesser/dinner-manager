class AdminPannelController < ApplicationController
  # before_action :user_show

  def index
    # @user = policy_scope(User).order(created_at: :desc)
  end

  # def user_show
  #   @user = User.find(params[:user_id])
  #   authorize @user
  # end
end
