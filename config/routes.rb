PairWithMe::Application.routes.draw do
  match 'example-katas' => 'pages#example_katas'

  root :to => 'home#index'
end
