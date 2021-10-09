Rails.application.routes.draw do
  resources :contacts
  mount Rswag::Ui::Engine => '/api/docs'
  mount Rswag::Api::Engine => '/api/docs'
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
  get "auth/me" => "auth#me"
  get "/organization/public", to: "organizations#show"
  post "/organization/public", to: "organizations#update"
  get "*path" => 'application#not_found', constraints: lambda { |req|
                  req.path.exclude? 'rails/active_storage'
}
end
