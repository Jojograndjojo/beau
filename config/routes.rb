Rails.application.routes.draw do
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
    get '/drawings', to:'artpieces#drawings'
    get '/paintings', to:'artpieces#paintings'
    get '/printmakings', to:'artpieces#printmakings'
  end

  root to: 'homepages#index'

end
