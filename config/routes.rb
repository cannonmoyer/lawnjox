Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "quotes#index"
  
  post 'addresses/import', to: 'addresses#import', as: 'import_addresses'
  get '/quotes/generate', to: 'quotes#generate', as: 'generate_quote'
  get '/addresses/search', to: 'addresses#search', as: 'search_addresses'
  resources :addresses
  resources :quotes
  
  
  
end
