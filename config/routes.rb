PairWithMe::Application.routes.draw do
  devise_for :users
  resources :users, :only => ["show"]

  match 'example-katas' => 'pages#example_katas'

  root :to => 'home#index'
end
