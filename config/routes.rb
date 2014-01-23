Gaffrenter::Application.routes.draw do
  

  #hook up urls with rooms controller
  resources :gaffs

  #go to the homepage
  root "gaffs#index"





end
