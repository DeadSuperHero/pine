Rails.application.routes.draw do
  devise_for :authors
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root :to => "articles#index"

match '/author/:id', :to => 'authors#show',  :as => :author,  :via => :get

end
