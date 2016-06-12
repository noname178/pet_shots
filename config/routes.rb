Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users
  root 'home#index'

  resources :home, only: :index

  namespace :articles do
    resources :popular, only: :index
    resources :recent, only: :index
  end
  resources :articles, only: [:show, :new, :create, :edit, :update, :destroy], shallow: true do
    collection do
      get 'search'
    end
    scope module: :articles do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :tags, only: [:index, :show]

  devise_for :users
  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :pets, only: [:index, :destroy] do
      collection do
        get 'mypet'
      end
    end
  end

  resources :likes, only: [:create, :destroy]
end
