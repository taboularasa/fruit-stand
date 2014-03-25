FruitStand::Application.routes.draw do
  resources :checkout, only: [:show, :update]
end
