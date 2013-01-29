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
  namespace :member, path: 'settings', as: :member do
    resources :users, path: 'p', except: [:index, :show, :update, :edit, :destroy] do
      collection do
        get 'basic'
        put 'basic'
        get 'details'
        put 'details'
        get 'interests'
        put 'interests'
        get 'education'
        put 'education'
        get 'career'
        put 'career'
        get 'portrait'
        put 'portrait'
      end
    end

    root :to => 'users#basic'
  end

  root :to => 'home#index'
end
