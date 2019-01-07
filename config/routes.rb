

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "public/pages#top"


  namespace :admin do
    get    "/manual",  to: "pages#manual"


    resources :users do
      member do
        patch :toggle_admin
      end
    end

    resources :items do
      member do
        patch :confirm
        patch :reject
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
    resources :items do
      resources :chat do
        resources :messages, only: [:create, :update]
      end
    end
    resources :categories, only: [:show],param: :path_name do
      collection do
        get :all
      end
    end
  end

  namespace :api, {format: 'json'} do
    get    "/get_tags", to: "get_tags#index"
    get    "/get_sub_cates", to: "get_sub_cates#index"
  end

end
