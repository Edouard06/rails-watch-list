Rails.application.routes.draw do
  resources :lists do
    resources :reviews
    resources :bookmarks, only: [:index, :new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
