Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, :projects, :projectcategories
      post '/sessions', to: 'sessions#create'
      get '/sessions/current_user', to: 'sessions#show'
      post '/users/get_clients', to: 'users#get_clients'
      post '/users/get_client_project_categories', to: 'users#get_client_project_categories'
    end
  end
end
