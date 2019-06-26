class MembershipsController < ApplicationController
  before_action :set_group, only: %i[new update edit]
  before_action :set_membership, only: %i[edit update]
  before_action :set_dinner, only: %i[update edit]
  before_action :membership_params, only: %i[update]

  def index
  end

  def new
    @member_list = Membership.group(!group_show.id)
    @membership = Membership.new
    @group = Group.find(group_show.id)
    authorize @membership
    # raise
    # Invite people with a link
    # when creating a new memer you can add a memeber to a group.
  end

  def create
    @group = Group.find(group_show.id)
    @membership = Membership.new(membership_params)
    @membership.email = User.find(@membership.user_id).email
    @membership.group_id = Group.find(group_show.id).id
    authorize @membership

    @membership.save
    if @membership.save
      redirect_to group_path(@group), notice: "Group #{@group.name} was succesfully created!"
    else
      render :new
    end
  end

  def edit; end

  def update
    @membership.email = current_user.email
    if @membership.update(membership_params)
      # # TODO: Why can't I get the group_dinner_path to work? The route is there....
      # redirect_to group_dinner_path [@group, @dinner], notice: "Attending status has been updated"
      redirect_to group_path @group, notice: "#{current_user.first_name} #{current_user.last_name} has been updated"
    end
  end

  def members_status
    @members = Memeber.all
    authorize @members
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
    authorize @group
  end

  def set_dinner
    @dinner = Dinner.find(params[:dinner_id])
    authorize @dinner
  end

  def set_membership
    @membership = Membership.find(params[:memberships_id])
    authorize @membership
  end

  def membership_params
    params.require(:membership).permit(:user_id, :attending, :email)
  end


end
