Rails.application.routes.draw do
  resources :news
  resources :testimonials
  resources :roles
  resources :organizations
  resources :members
  resources :activities
  resources :users
  resources :categories

  post "auth/register" => "auth#register" 
  post "auth/login" => "auth#login"
  get '/*a', to: 'application#not_found'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
