Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome, only: [:index]
  resources :mountains, only: [:index, :show]

  root "welcome#index"

end
