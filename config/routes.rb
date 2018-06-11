Rails.application.routes.draw do

  root 'application#home'

  resources :users, only: [:create]
  resources :shortners, only: [:create]

  get '/:url' => 'shortners#redirect'

end
