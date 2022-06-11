Rails.application.routes.draw do
  resources :lists, except: [:update, :edit] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
  resources :movies, only: [:show, :index]
end
