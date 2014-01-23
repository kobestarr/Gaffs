Gaffrenter::Application.routes.draw do
 
  get "sessions/new"
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
