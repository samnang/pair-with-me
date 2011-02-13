PairWithMe::Application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :update]

  match 'example-katas' => 'pages#example_katas'

  root :to => 'home#index'
end
