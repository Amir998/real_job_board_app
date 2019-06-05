Rails.application.routes.draw do

  root 'jobs#index'
  resources :jobs, except: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
