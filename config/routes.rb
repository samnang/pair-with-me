PairWithMe::Application.routes.draw do
  devise_for :users

  match 'example-katas' => 'pages#example_katas'

  root :to => 'home#index'
end
