Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  root :to => 'welcome#index'

  resources :articles

  get 'articles/myarts'

end
