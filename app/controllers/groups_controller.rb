class GroupsController < ApplicationController
  before_action :group_show, only: %i[show]
  def index
    @groups = policy_scope(Group).order(created_at: :desc)

  end

  # if admin and he is owner of the group then show hin the admin details

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    authorize @group
    if @group.save
      Membership.create(user_id: current_user.id, group_id: @group.id, email: current_user.email)
      redirect_to groups_path, notice: "Group #{@group.name} was succesfully created!"
    else
      render :new
    end
  end

  def edit; end

  def new
    @group = Group.new
    authorize @group
  end

  def update
  end

  def show
    @members = Membership.where(group_id: @group.id)
    @member = Membership.where(user_id: current_user).where(group_id: @group.id).first
    @dinners = Dinner.where(group_id: @group.id)
  end

  def destroy
  end

  private

  def group_show
    @group = Group.find(params[:id])
    authorize @group
  end

  def group_params
    params.require(:group).permit(:name, :user_id)
  end
end
