Rails.application.routes.draw do
  root 'home#index'
  resources :categorias
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'usuario/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :articulos
  resources :pedidos
  resources :departamentos
  resources :enviarpedidos
end
