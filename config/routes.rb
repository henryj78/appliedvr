Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipesteps
      resources :recipes
    end
  end

  root "home#index"

  post "refresh" , controller: :refresh, action: :create
  post "signin" , controller: :signin, action: :create
  delete "signin" , controller: :signin, action: :destory
  post "signup" , controller: :signup, action: :create
end
