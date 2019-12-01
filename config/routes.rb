Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :api do
namespace :v1 do
resources :verticals, except: [:new, :edit] do
    resources :categories do
      resources :courses
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
end
end
end