Rails.application.routes.draw do
  devise_for :users
  root to: 'tips#index'
  resources :users, only: :show
  resources :tips do
    collection do
      get 'search'
      get 'tagsearch'
      get 'detail_search'
    end
    resources :comments, only: :create
  end
end
