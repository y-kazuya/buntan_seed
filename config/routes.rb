Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "public/pages#top"

  namespace :admin do

    resources :users do
      member do
        patch :toggle_admin
      end
    end

    resources :items do
      member do
        patch :toggle_status
      end
    end

    resources :tags
    resources :usages

  end

  scope module: :public do
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :users
    resources :items

  end

  namespace :api, {format: 'json'} do
    get    "/get_tags", to: "get_tags#index"
  end

end
