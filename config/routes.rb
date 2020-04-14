Rails.application.routes.draw do

  get 'products/index' => 'products#index'
  get 'products/show/:id' => 'products#show'
  post 'products/check/:id' => 'products#check' 
  get 'products/confirm' => 'products#confirm'
  get 'products/order' => 'products#order'

end
