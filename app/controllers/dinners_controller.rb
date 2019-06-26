class DinnersController < ApplicationController
  before_action :group_show, only: %i[new create show destroy update edit]
  before_action :dinner_show, only: %i[show edit update destroy]

  def index
    @dinners = policy_scope(Dinner).order(created_at: :desc)
  end

  def new
    @dinner = Dinner.new
    authorize @dinner
  end

  def create
    @dinner = Dinner.new(dinner_params)
    @dinner.group_id = group_show.id
    authorize @dinner
    if @dinner.save
      current_member = Membership.where(user_id: current_user).where(group_id: @dinner.group_id).first
      current_member.attending = true
      redirect_to group_path(group_show), notice: "Dinner #{@dinner.name} was succesfully created"
    else
      render :new
    end
  end

  def show
    @members = Membership.where(group_id: @group.id)
    @member = Membership.where(user_id: current_user).where(group_id: @group.id).first
  end

  def destroy
    @dinner.destroy
    redirect_to group_path(@group)
  end

  def edit; end

  def update
    if @dinner.update(dinner_params)
      redirect_to group_dinner_path(@group, @dinner)
    else
      render :edit
    end
  end

  private

  def dinner_show
    @dinner = Dinner.find(params[:id])
    authorize @dinner
  end

  def group_show
    @group = Group.find(params[:group_id])
    authorize @group
  end

  def dinner_params
    params.require(:dinner).permit(:name, :date, :group_id)
  end
end
