Rails.application.routes.draw do
  resources :equipamentos
  resources :comandos
  resources :arduinos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
