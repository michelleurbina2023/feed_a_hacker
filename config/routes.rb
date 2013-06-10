Feedhacker::Application.routes.draw do
  get 'home' => 'sites#home', :as => :home

  match 'signup' => 'hackers#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  match 'hacker/edit' => 'hackers#edit', :as => :edit_current_hacker

  match 'payments/new' => 'payments#new', :as => :new_payment

  root :to => "sites#home"

  resources :sessions, :except => [:update, :show, :edit, :index]

  resources :payments

  resources :projects

  resources :hackers do
    resources :payments
  end

  root :to => 'sites#home'
end
