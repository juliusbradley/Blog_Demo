Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "posts#home"

resources :posts do
  resources :comments
end

resources :users, only: [:new, :create]


resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end


end
