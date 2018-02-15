Rails.application.routes.draw do
  get 'arduinos/index'

  root :to => "arduinos#index"
  devise_for :users
  resources :equipamentos
  resources :comandos
  resources :arduinos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
