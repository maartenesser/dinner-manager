class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @dinners_today = []
    @dinners_upcoming = []
    @dinners_past = []
    @current_membership = Membership.find_by_user_id(current_user)
    if current_user.present?
      @current_attendee = Attendee.find_by_membership_id(@current_membership.id)
      @group = Group.find_by_id(@current_membership.group_id)
      @dinner = Dinner.find_by_id(@current_attendee.dinner_id)
    end


    @groups_of_current_user = Group.where(user_id: current_user)
    @groups_of_current_user.each do |group_of_current_user|
      @dinners = Dinner.where(group_id: group_of_current_user)
      @dinners.each { |dinner|
        @dinners_today.push(dinner) if dinner.datetime.to_date == DateTime.current.to_date
        @dinners_upcoming.push(dinner) if dinner.datetime.to_date > DateTime.current.to_date
        @dinners_past.push(dinner) if dinner.datetime.to_date < DateTime.current.to_date
      }
    end
  end

  def change_attending_status
    @bcurrent_attendee.toggle!(:attending)
  end
end
