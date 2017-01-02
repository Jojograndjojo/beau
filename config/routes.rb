Rails.application.routes.draw do
  resource :homepage, :admins do
  end

  resource :artpieces do
    get '/drawings', to:'artpieces#drawings'
    get '/paintings', to:'artpieces#paintings'
    get '/printmakings', to:'artpieces#printmakings'
  end

  root to: 'homepages#index'

end
