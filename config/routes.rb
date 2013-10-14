LightItUp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'welcome/index'
  root "welcome#index"

  resources :users, :slideshows, :slides, :elements

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  get 'profile/:id' => 'users#show'

  post 'cast' => 'slideshows#cast'

  post 'elements/ajax/:id' => 'ajax#element_update'
  post 'slide-bg/:id' => 'ajax#slide_update'

end
