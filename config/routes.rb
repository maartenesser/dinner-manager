Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # devise_for :users, controllers: { invitations: 'users/invitations' }

  # get "groups/:group_id/memberships", to: "memberships#index", as: :memberships
  # resources :memberships, controllers: {invitations: 'memberships/invitations'}
  # resources :memberships, only: [:index]


  resources :groups do
    # resources :invites, only: [:new, :create, :index]
    resources :invites, only: [:new, :create]
    get "groups/:group_id/invites", to: "invites#new", as: :invite
    resources :memberships, only: [:new, :create, :index, :edit, :destroy]
    patch "groups/:group_id/dinners/:dinner_id/memberships/:memberships_id", to: "memberships#update", as: :dinner_membership
    resources :dinners, only: [:new, :create, :edit, :update, :destroy, :show]

    resources :dinners do
      resources :attendees, only: [:create, :show, :update]
    end
  end
end
