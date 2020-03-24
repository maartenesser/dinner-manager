Rails.application.routes.draw do

  default_url_options :host => "http://0.0.0.0:3000/"

  devise_for :users
  root to: 'pages#home'

  resources :admin_pannel, only: [:index]
  get "admin_pannel/groups", to: "admin_pannel#group", as: :admin_pannel_groups

  # devise_for :users, controllers: { invitations: 'users/invitations' }

  # get "groups/:group_id/memberships", to: "memberships#index", as: :memberships
  # resources :memberships, controllers: {invitations: 'memberships/invitations'}
  # resources :memberships, only: [:index]
#
# devise_for :users_admin

  resources :groups do
    # resources :invites, only: [:new, :create, :index]
    # resources :invites
    # , only: [:new, :create]
    # get "groups/:group_id/invites", to: "invites#new", as: :invite
    resources :memberships, only: [:new, :create, :index, :edit, :destroy]
    patch "groups/:group_id/dinners/:dinner_id/memberships/:memberships_id", to: "memberships#update", as: :dinner_membership
    resources :dinners, only: [:new, :create, :edit, :update, :destroy, :show]

    resources :dinners do
      resources :attendees, only: [:create, :show, :update]
    end
  end
end
