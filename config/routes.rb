FruitStand::Application.routes.draw do
  resources :checkout, only: [:edit, :update]
end
