Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :admin do
    root :to => "admins#index", :as => "authenticated_admin"
  end

  authenticated :user do
    root :to => 'users#index', :as => 'authenticated_user'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'admins' => "admins#home"
  get 'admins/dashboard' => "admins#index"

  # You can have the root of your site routed with "root"
  root 'users#home'

  get 'users/dashboard' => 'users#index'
  get 'user/:id' => 'users#show', :as => 'show_user'
  get 'user/edit' => 'users#edit', :as => 'edit_user'
  patch 'user/update_password' => 'users#update_password'
  patch 'user/:id/edit' => 'users#update'


end
