Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  get 'articles/my_article'

  root :to => 'welcome#index'

  resources :articles
end
