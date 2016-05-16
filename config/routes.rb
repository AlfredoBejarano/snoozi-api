Rails.application.routes.draw do
  resources :dog
  match '*any' => 'application#options', :via => [:options]
end
