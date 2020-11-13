Rails.application.routes.draw do
  root to: 'cocktails#index' # index itself should be the root
  # get 'doses/new'
  # get 'doses/create'
  # get 'doses/delete'
  # get 'cocktails/index'
  # get 'cocktails/show'
  # get 'cocktails/new'
  # get 'cocktails/create'
  # get 'cocktails/edit'
  # get 'cocktails/update'
  # get 'cocktails/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails do
    # now doses are nested within the cocktail routes
     # so they get prepended with 'cocktails/:cocktail_id'
    resources :doses, only: [:new, :create] # only establishes routes for the ones in brackets
  end

  resources :doses, only: [:destroy] # deleting an ingredient you only need the id of the dose not the one of the cocktails prepended
end
