Icmoc::Application.routes.draw do
  
  match '/session' => "session#index",  as: :new_session, via: [:get]
  match '/session/new' => "session#new",    as: :sign_up, via: [:get]
  match '/session/new' => "session#create",    as: :create_session, via: [:post]
  match '/login' => "session#login",    as: :session, via: [:post]
  match '/logout' => "session#logout",    as: :logout, via: [:delete]

  resources :articles

  namespace :admin, as: :admin, path: 'admin' do
    resources :provinces
    resources :cities
    resources :districts
    resources :personalities
    resources :categories
    resources :users
    resources :contacts
    root :to => 'provinces#index'
  end
  namespace :member, path: 'settings', as: :member do
    resources :users, path: 'p', only: [] do
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
        delete 'destroy_career'
      end
    end

    root :to => 'users#basic'
  end
  resources :contacts


  root :to => 'home#index'
end
