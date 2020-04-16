Rails.application.routes.draw do

  get '/login' => 'users#login' 
  post '/mypage' => 'users#mypage'
  post '/logout' => 'users#logout'

  get 'users/index' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/edit/:id' => 'users#edit'
  post 'users/update/:id' => 'users#update'
  post 'users/destroy' => 'users#destroy'

  get 'products/index' => 'products#index'
  get 'products/show/:id' => 'products#show'
  post 'products/check/:id' => 'products#check' 
  get 'products/confirm' => 'products#confirm'
  get 'products/order' => 'products#order'

end
