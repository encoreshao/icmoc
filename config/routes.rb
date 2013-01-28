Icmoc::Application.routes.draw do
  
  match '/session' => "session#index",  as: :new_session, via: [:get]
  match '/login' => "session#login",    as: :session, via: [:post]
  match '/logout' => "session#logout",    as: :logout, via: [:delete]

  resources :articles

  namespace :admin do
    resources :provinces
    resources :cities
    resources :districts
    resources :users do
      member do
        post 'mark_as_admin'
        post 'mark_as_user'
      end
    end
    root :to => 'provinces#index'
  end
  namespace :member, path: 'setting', as: :member do
    resources :users, path: 'profile', except: [:index, :show, :update, :edit, :destroy] do
      collection do
        match 'basic' => 'basic', via: [:get, :put]
        match 'details' => 'details', via: [:get, :put]
        match 'interests' => 'interests', via: [:get, :put]
        match 'education' => 'education', via: [:get, :put]
        match 'career' => 'career', via: [:get, :put]
        match 'portrait' => 'portrait', via: [:get, :put]
      end
    end

    root :to => 'users#basic'
  end

  root :to => 'home#index'
end
