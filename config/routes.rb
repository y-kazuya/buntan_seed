Rails.application.routes.draw do
  devise_for :users,controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    sessions: "users/sessions",
                                    registrations: "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "public/pages#top"
  root to: 'public/pages#top'
  get "/", to: "public/pages#top", as: "user_root"
  get "/users/edit",to: "public/pages#top"
  get "/user/edit",to: "public/pages#top"
  get "/user/basic" ,to: "public/pages#top"
  get "/user/new" ,to: "public/pages#top"
  get "/users/edit", to: "public/pages#top"
  get "/user/edit", to: "public/pages#top"
  get "/about", to: "public/pages#top"
  get "/item/new", to: "public/pages#top"
  get "/item/:id", to: "public/pages#top"


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
    get    "/get_items",     to: "get_items#index"
    get    "/get_items_category", to: "get_items#category"
    get    "/get_state",     to:  "get_state#index"
    get    "/get_current_user", to: "current_user#index"
    put    "/update_current_user", to: "current_user#update"
    get    "/get_item",   to: "get_items#show"
    get    "/check_unique", to: "check_unique#index"
    get    "/check_login",  to: "current_user#check"
  end

  namespace :api do
    post   "/create_item",         to: "create_item#index"
  end


end
