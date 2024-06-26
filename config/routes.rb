Rails.application.routes.draw do
  
  devise_for :users

  match 'tasks/complete/:id' => 'tasks#complete', as: 'complete_task', via: :put

  resources :tasks


  root "tasks#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # root to: "home#index" 

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"  
end
