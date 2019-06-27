Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # devise_for :users, controllers: { invitations: 'users/invitations' }

  # get "groups/:group_id/memberships", to: "memberships#index", as: :memberships
  # resources :memberships, controllers: {invitations: 'memberships/invitations'}
  # resources :memberships, only: [:index]
  resources :invites

  resources :groups do
    # resources :invites, only: [:new, :create, :index]
    resources :memberships, only: [:new, :create, :index, :edit, :destroy]
    patch "groups/:group_id/dinners/:dinner_id/memberships/:memberships_id", to: "memberships#update", as: :dinner_membership
    resources :dinners, only: [:new, :create, :edit, :update, :destroy, :show]
  end
  # create a nested route so that dinners is nested in groups

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
