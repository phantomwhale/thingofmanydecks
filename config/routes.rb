Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :decks, only: [:new, :show, :create] do
    post :draw
  end
end
