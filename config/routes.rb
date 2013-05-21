Feedhacker::Application.routes.draw do
  get 'home' => 'sites#home', :as => :home

  get 'about' => 'sites#about', :as => :about

  match 'signup' => 'hackers#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  match 'hacker/edit' => 'hackers#edit', :as => :edit_current_hacker

  root :to => "sites#home"

  resources :sessions, :except => [:update, :show, :edit, :index]

  resources :hackers

  root :to => 'sites#home'
end
