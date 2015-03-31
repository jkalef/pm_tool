Rails.application.routes.draw do
  
  #home route to handle the homeepage (index action)
  root "home#index"

  #routes for the other static pages About and Contact
  get "/about" => "home#about", as: :about
  get "/contact" => "home#contact", as: :contact


  #routes for projects
  resources :projects


  #route for my search results
  get "/search" => "projects#search", as: :search

  
end
