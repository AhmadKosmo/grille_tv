Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :programmes
  resources :realisateurs
  resources :chaines
  resources :diffusions
  root 'programmes#index'

  # get 'filterDiffusions', to: 'diffusions#filter'
end
