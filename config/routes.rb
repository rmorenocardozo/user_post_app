Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index" #Solo puede haber un root.
  resources :posts do
    resources :comments, only: [:create, :destroy] #Con esto se puede delimitar lo que quiero de las rutas y, con ello, las acciones.
  end
end
