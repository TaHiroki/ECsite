Rails.application.routes.draw do

  get 'products/index' => 'products#index'
  get 'products/show/:id' => 'products#show'
  post 'products/check/:id' => 'products#check' 

end
