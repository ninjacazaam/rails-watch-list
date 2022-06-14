Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, except: [:update, :edit, :index] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
  resources :movies, only: [:show, :index]
end
