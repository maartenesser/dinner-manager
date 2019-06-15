class DinnersController < ApplicationController

  def index
    @dinners = policy_scope(Dinner).order(created_at: :desc)
  end

  def new
    @dinner = Dinner.new
    authorize @dinner
  end

  def create
    @dinner = Dinner.new(dinner_params)
    authorize @dinner
    if @dinner.save
      redirect_to dinners_path, notice: "Dinner #{@dinner.name} was succesfully created"
    else
      render :new
    end
  end

  def show
  end

  private

  def dinner_params
    params.require(:dinner).permit(:name, :date, :group_id)
  end
end
