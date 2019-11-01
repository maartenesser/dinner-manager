class AdminPannelController < ApplicationController
  before_action :check_if_admin

  def index
    # Zoekfunctie voor Users
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

  end

  def group
    # filter voor groupen
    @query = params[:filter]
    if @query.present?
      @field = @query[:field]
      if @field.empty?
        @dinners = Dinner.all
      else
        @dinners = Dinner.where(id: @field)
      end
    else
      @dinners = Dinner.all
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
    params.require(:filter).permit(:field)
  end

end
