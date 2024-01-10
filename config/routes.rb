Rails.application.routes.draw do
  get 'movies/lists'
  get 'movies/bookmarks'
  root to: 'movies#index'

  resources :movies do
    resources :bookmarks, only: [:new, :create]
  end

  resources :lists do
    resources :bookmarks, only: [:create, :destroy]
  end

end
