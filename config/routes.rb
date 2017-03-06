Rails.application.routes.draw do
  resources :abouts
  resource :homepage, :users do
  end

  resource :admins do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
    get '/management', to: 'admins#management'
    post '/send_invitation', to: 'admins#send_invitation'
  end

  resource :artpieces do
    post '/update_homepage_picture', to: 'artpieces#update_homepage_picture'
    post '/move_up', to: 'artpieces#move_up'
    post '/move_down', to: 'artpieces#move_down'
  end

  root to: 'homepages#index'

end
