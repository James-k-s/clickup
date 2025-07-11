Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "pages#home"
  get "overview", to: "pages#overview", as: :overview
  get "settings", to: "pages#settings", as: :settings
  resources :lists, only: [:index, :new, :create, :edit, :update] do
    resources :list_items, only: [:create]
  end

  resources :tasks, only: [:index, :create, :new, :edit, :update, :destroy] do
    resources :task_comments, only: [:create]
  end

  resources :habit_trackers, only: [:index, :new, :create, :edit, :update] do
    resources :habit_items, only: [:new, :create]
  end

  resources :habit_items do
    post :toggle_today, on: :member, to: 'habit_logs#toggle'
  end



  # Defines the root path route ("/")
  # root "posts#index"
end
