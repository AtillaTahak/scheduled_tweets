Rails.application.routes.draw do
  get "about-us", to: "about#index", as: :about
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  root "main#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
