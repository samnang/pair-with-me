PairWithMe::Application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :update]
  resources :pair_requests, :only => [:create, :update]

  match 'my_schedules' => 'pair_requests#index'
  match 'example_katas' => 'pages#example_katas'

  root :to => 'home#index'
end
