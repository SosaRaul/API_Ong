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
  get "/organization/public", to: "organizations#show"
  post "/organization/public", to: "organizations#update"
  get '/*a', to: 'application#not_found'

end
