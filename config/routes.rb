Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, :projects, :projectcategories, :comments
      post '/sessions', to: 'sessions#create'
      get '/sessions/current_user', to: 'sessions#show'
      post '/users/get_clients', to: 'users#get_clients'
      post '/users/get_admins', to: 'users#get_admins'
      post '/users/get_client_project_categories', to: 'users#get_client_project_categories'
      post '/projects/filter_projects', to: 'projects#filter_projects'
      post '/projects/get_my_projects', to: 'projects#get_my_projects'
      post '/projects/get_admin_projects', to: 'projects#get_admin_projects'
      post '/projects/update_title', to: 'projects#update_title'
    end
  end
end
