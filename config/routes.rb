Rails.application.routes.draw do
  resources :tipo_reservas
  resources :reservas
  resources :tipo_espacios
  resources :datos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
