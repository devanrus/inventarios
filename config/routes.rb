Rails.application.routes.draw do
  root 'home#index'
  resources :categorias
  devise_for :users, :skip => [:registrations]
  resources :articulos
  resources :pedidos
  resources :departamentos
  resources :enviarpedidos
end
