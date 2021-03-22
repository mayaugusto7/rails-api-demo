Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  apipie
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :users
      resources :pets
    end
  end
end
