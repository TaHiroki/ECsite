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

  get 'masters/index' => 'masters#index'
  get 'masters/edit/:id' => 'masters#edit'
  post 'masters/update/:id' => 'masters#update'
  get 'masters/new' => 'masters#new'
  post 'masters/create' => 'masters#create'
  get 'masters/edit/product/:id' => 'masters#edit_product'
  post 'masters/update/product/:id' => 'masters#update_product'
  get  'masters/userlist' => 'masters#userlist'

  get 'products/index' => 'products#index'
  get 'products/show/:id' => 'products#show'
  post 'products/check/:id' => 'products#check' 
  get 'products/confirm' => 'products#confirm'
  get 'products/order' => 'products#order'
  get 'products/ordersum' => 'products#ordersum'
  get 'products/ordershow/:id' => 'products#ordershow'

end
