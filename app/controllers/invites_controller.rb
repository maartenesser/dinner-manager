class InvitesController < ApplicationController
  before_action :group_show, only: %i[new create]

  def new
    @invite = Invite.new
    authorize @invite
  end

  def create
    select_email = User.select(:email).find_by(email: invite_params[:email])
    user = User.find_by(email: invite_params[:email])
    if select_email
      Membership.create(user: user, group_id: @group, email: user.email)
    else
      @invite = Invite.new(email: invite_params[:email])
      @invite.sender = current_user
      @invite.recipient_id = invite_params
      User.create(email: invite_params[:email])
      Membership.create(user: user, group_id: @group, email: invite_params[:email])
    end
  end

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

    # @invite = Invite.new(invite_params[:email])
    # @invite.sender = current_user
    # @invite.group = Group.find(params[:group_id])
    # @invite.recipient_id = invite_params
    # authorize @invite

    # if invite.save!
    #   InviteMailer.new_group_invite(@invite, new_user_registration_path(invite_token: @invite.token)).deliver
    #   redirect_to groups_path, notice: "Person was succesfully invited!"
    # else
    #   render :new
    # end

  private

  def invite_params
    params.require(:invite).permit(:email)
  end

  def group_show
    @group = Group.find(params[:group_id])
    authorize @group
  end
end
