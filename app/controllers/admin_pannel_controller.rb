class AdminPannelController < ApplicationController
  before_action :check_if_admin
  # before_action :search_params, only: [:index]

  def index
    # if just going to the main page the params are not there and it will give you an error


 # @cocktails = Cocktail.all
    # @search = params["search"]
    # if @search.present?
    #   @name = @search["name"]
    #   @cocktails = Cocktail.where(name: @name)
    # end
    @search = params[:search]
    if @search.present?
      @query = @search[:query]
      if @query.empty?
        @user = User.all
      else
        @user = User.where("last_name ILIKE ?", @query)
      end
    else
      @user = User.all
    end

    @filter = params[:filter]
    if @filter.present?
      @input = @filter[:status]
      @user = User.where("admin = ?", @input)
    end
  end

  private

  def check_if_admin
    redirect_to root_path unless current_user.admin?
  end

  def search_params
    params.require(:search).permit(:query)
  end

  def filter_params
    params.require(:filter).permit(:admin)
  end

end
