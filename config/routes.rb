Rails.application.routes.draw do

  resources :job_application
  resources :jobs do
    member do 
      get :apply_for_job
    end
  end
  #root 'jobs#index'
  root 'home#index'
  
  get "/jobs", to: "jobs#index"
    devise_for :users

    resources :conversations, only: [:create] do
      member do
        post :close
      end
      resources :messages, only: [:create]
    end
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
