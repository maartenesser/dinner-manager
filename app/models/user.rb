class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships, dependent: :destroy
  has_many :groups
  has_many :invitations, class_name: "Invite", foreign_key: 'recipient_id'
  has_many :sent_invites, class_name: "Invite", foreign_key: 'sender_id'

  mount_uploader :user_photo, PhotoUploader
end
