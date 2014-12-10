Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "session/registrations" }

  get "dashboards/index", to: "dashboards#index", as: "dashboard"
  
  resources :subscribes, only: [:create]
  resources :adverts do 
    resources :comments, only: [:create]
  end

  root 'adverts#index', to:'advert#index'
end
