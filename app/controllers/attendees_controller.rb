class AttendeesController < ApplicationController
  before_action :set_group, only: %i[update create]
  before_action :set_dinner, only: %i[update create]
  before_action :set_attendee, only: %i[update]


  def create
    group_members = Membership.where(group_id: @group)

    group_members.each do |member|
      Attendee.create(dinner_id: @group, membership_id: member.id)
    end
    redirect_to group_dinner_path(@group, @dinner)
  end

  def new
  end

  def edit; end

  def update


    if @attendee.update(attendee_params)
      attendant = update_attendee_params[:attendant_id]
      if attendant.present?
        @attendant = Attendee.find(attendant.to_i)
        @attendant.attending = !@attendant.attending
        @attendant.save
      end
      redirect_to group_dinner_path(@group, @dinner), notice: "your infromation has been saved"
    end
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
    @membership = Membership.find(params[:membership_id])
  end

  def set_attendee
    @attendee = Attendee.find(params[:id])
    authorize @attendee
  end

  def attendee_params
    params.require(:attendee).permit(:guests, :attending, :comment)
  end

  def update_attendee_params
    params.require(:attendee).permit(:attendant_id)
  end
end
