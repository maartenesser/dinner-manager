class AdminPannelController < ApplicationController
  before_action :check_if_admin

  def index
    @user = User.all
    # if just going to the main page the params are not there and it will give you an error
    if params[:search][:query].present?
      @user = User.all
    else
      @user = User.where("last_name LIKE ?", params[:search][:query])
    end
  end

  private

  def check_if_admin
    redirect_to root_path unless current_user.admin?
  end

end
