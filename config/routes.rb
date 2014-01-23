Gaffrenter::Application.routes.draw do
 
#this page is the urls of our websites 

  
  #hook up urls with rooms controller
  resources :gaffs

  #sign up our users to the site
  resources :users

  #go to the homepage
  root "gaffs#index"





end
