Gaffrenter::Application.routes.draw do
 
  # get "orders/index"
  # get "orders/show"
  # get "orders/new"
  # get "sessions/new"

#orders are inside the gaff because we want to place an order on a room

resources :gaffs do

    resources :orders, only: [:new, :create]

  end

  #mt list of orders dont have to be on a gaff
  resources :orders, only: [:index, :show]

#this page is the urls of our websites 

  
  #hook up urls with rooms controller
  resources :gaffs

  #sign up our users to the site
  resources :users

  #log in and log out of our site
  resource :session 
  # both resource and session are in the singular in this case
  #it is because you can only do one session


  #go to the homepage
  root "gaffs#index"





end
