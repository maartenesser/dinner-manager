class AdminPannelController < ApplicationController
  before_action :check_if_admin

  def index
    if params[:search][:query] == ""
      @user = User.all
    else
      @user = User.where("last_name LIKE ?", params[:search][:query])

    end
  end

  def search
    @search
    if @user.empty?
      @users = User.all
    else
      @users
    end
  end

  private

  def check_if_admin
    redirect_to root_path unless current_user.admin?
  end

end
