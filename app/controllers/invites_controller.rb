class InvitesController < ApplicationController
  before_action :group_show, only: %i[new create]

  def new
    @invite = Invite.new
    authorize @invite
  end

  def create
    user = User.find_by(email: email)
    user = User.invite!(email: email) unless user.present?
    # @invite = Invite.new
    # @invite.user = user

    # TODO !!!!
    # find user in de database
    # If user is found the add him to the group
    # if user is not found
      # Create a user with email and add him to the group
      # sent him an E-mail invitation
        # User.invite!(email: email)

    # group =

    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    @invite.group_id = Group.find(params[:group_id]).id
    # @invite.recipient_id = invite_params
    authorize @invite

    if @invite.save!
      InviteMailer.new_group_invite(@invite, new_user_registration_path(invite_token: @invite.token)).deliver
      redirect_to groups_path, notice: "Person was succesfully invited!"

    else
      render :new
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email)
  end

  def group_show
    @group = Group.find(params[:group_id])
    authorize @group
  end
end
