Rails.application.routes.draw do
  # get 'event_comments/Index'
  # get 'event_comments/New'
  # get 'event_comments/Show'
  # get 'place_comments/Index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :places
  resources :users
  resources :sessions
  resources :events
  resources :nearmes
  resources :profiles
  resources :nearmelists
  resources :categories
  resources :place_comments
  resources :event_comments
  resources :user_mailers
  #post 'send_mail', to: 'user_mailers#create', as: 'welcome_email'
end
