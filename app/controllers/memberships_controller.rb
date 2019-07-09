class MembershipsController < ApplicationController
  before_action :set_group, only: %i[new update edit destroy]
  before_action :set_membership, only: %i[edit update]
  before_action :set_dinner, only: %i[update edit]
  before_action :membership_params, only: %i[update]

  def index
  end

  def new
    @member_list = Membership.group(set_group.id)
    @membership = Membership.new
    @group = Group.find(set_group.id)
    authorize @membership
    # raise
    # Invite people with a link
    # when creating a new memer you can add a memeber to a group.
  end

  def create
    @group = Group.find(set_group.id)
    @membership = Membership.new(membership_params)
    @membership.email = User.find(@membership.user_id).email
    @membership.group_id = Group.find(set_group.id).id
    authorize @membership

    @membership.save
    if @membership.save
      redirect_to group_path(@group), notice: "#{@membership.user.first_name} #{@membership.user.last_name} was succesfully added to #{@group.name}!"
    else
      render :new
    end
  end

  def edit; end

  def destroy
    # raise
    @member = Membership.find(params[:id])
    @group_owner = @group.user_id
    if @current_user.id == @group_owner
      # Membership.delete_all.where(group_id: @group.id)
      # Dinner.delete_all.where(group_id: @group.id)
      @group.destroy
      redirect_to groups_path, notice: "The group and all dinners and members have been removed"
    else
      @member.destroy
      redirect_to group_path(@group)
    end
  end

  def update
    @membership.email = current_user.email
    if @membership.update(membership_params)
      # # TODO: Why can't I get the group_dinner_path to work? The route is there....
      # redirect_to group_dinner_path [@group, @dinner], notice: "Attending status has been updated"
      redirect_to group_dinner_path(@group, @dinner), notice: "#{current_user.first_name} #{current_user.last_name} has been updated"
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
