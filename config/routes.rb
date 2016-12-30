Rails.application.routes.draw do
  resource :homepage, :admins, :artpieces do
  end


  root to: 'homepages#index'

end
