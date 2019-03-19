Rails.application.routes.draw do
  resources :posts
  #patch 'posts/:id', to: 'posts#update'
  #the above line of code can also be used. resources is just a shorcut
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
