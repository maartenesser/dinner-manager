class MembershipsController < ApplicationController
  before_action :group_show, only: %i[new]
  def index
  end
  def new
    @membership = Membership.new
    @group = Group.find(group_show.id)
    authorize @membership
    # Invite people with a link
    # when creating a new memer you can add a memeber to a group.
  end

  def create
    @group = Group.find(group_show.id)
    @membership = Membership.new(membership_params)
    @membership.email = User.find(@membership.user_id).email
    @membership.group_id = Group.find(group_show.id).id
    authorize @membership

    @membership.save!
    if @membership.save
      redirect_to groups_path, notice: "Group #{@group.name} was succesfully created!"
    else
      render :new
    end
  end

  # how do I connect multiple persons to one group
  # how do I invite them to the group

  private


  def group_show
    @group = Group.find(params[:group_id])
    authorize @group
  end

  def membership_params
    params.require(:membership).permit(:user_id)
  end
end
