Rails.application.routes.draw do
  get 'movies/lists'
  get 'movies/bookmarks'
  root to: 'lists#index'

  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
resources :bookmarks, only: [:destroy], as: :delete_bookmark
end
