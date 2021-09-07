Rails.application.routes.draw do
  resources :news
  resources :testimonials
  resources :members
  resources :activities
  resources :users
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
