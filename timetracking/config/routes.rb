Rails.application.routes.draw do
  get '/' => 'site#home'
  get '/contact' => 'site#contact'

  resources :people
  resources :projects do
  	resources :entries
  end
  
  # get '/contact' => 'site#contact'
  # get '/projects' => 'projects#index'
  # get '/projects/:id' => 'projects#show'
  # get '/projects/:project_id/entries' => 'entries#index', as: 'project_entries'
  # post '/projects/:project_id/entries' => 'entries#create'
  # get '/projects/:project_id/entries/new' => 'entries#new'
end
