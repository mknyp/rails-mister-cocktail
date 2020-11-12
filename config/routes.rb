Rails.application.routes.draw do
  root to: 'cocktails#index'
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
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy] # deleting an ingredient you oly need the id of the dose not the one of the cocktails
end
