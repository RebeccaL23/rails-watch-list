Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:index, :show, :create, :new] do
    resources :bookmarks, only: [:create, :new, :show] do
    end
    member do
      get :movies_list
    end
  end
  resources :bookmarks, only: [:destroy]
  resources :movies, only: [:show]

end
