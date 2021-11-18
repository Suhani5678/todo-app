Rails.application.routes.draw do
  resources :job_application
  resources :jobs do
    get :apply_for_job, on: :member
  end
  root 'home#index'
  devise_for :users

  resources :conversations, only: [:create] do
    post :close, on: :member
    resources :messages, only: [:create]
  end

  # devise_scope :user do  
  #   get '/users/sign_out' => 'devise/sessions#destroy'     
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
