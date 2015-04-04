Rails.application.routes.draw do
  

  devise_for :users

  #home route to handle the homeepage (index action)
  root "home#index"

  #routes for the other static pages About and Contact
  get "/about" => "home#about", as: :about
  get "/contact" => "home#contact", as: :contact


  #routes for projects and discussions
  resources :projects do
  	resources :discussions 
  end

  #route for my search results
  get "/search" => "projects#search", as: :search

  resources :discussions do
    resources :comments
  end

  resources :projects do
    resources :tasks
  end

  resources :tasks do
    resources :task_comments
  end
  

end
