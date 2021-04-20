Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :apis do
    namespace :v1 do
      resources :users do
        resources :requests
      end
    end
  end

  resources :users do
    resources :requests
  end
  root to: 'static_pages#home'
end
