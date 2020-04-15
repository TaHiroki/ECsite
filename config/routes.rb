Rails.application.routes.draw do

  get '/login' => 'users#login' 
  post '/mypage' => 'users#mypage'

  get 'users/index' => 'users#index'
  get 'users/new' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/edit/:id' => 'users#edit'
  post 'users/update/:id' => 'users#update'

  get 'products/index' => 'products#index'
  get 'products/show/:id' => 'products#show'
  post 'products/check/:id' => 'products#check' 
  get 'products/confirm' => 'products#confirm'
  get 'products/order' => 'products#order'

end
