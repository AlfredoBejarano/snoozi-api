Rails.application.routes.draw do
  resources :dogs
  root :to => 'dogs#index'
  match '*any' => 'application#options', :via => [:options]
end
