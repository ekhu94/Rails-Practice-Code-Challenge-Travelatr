Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  patch "/posts/:id/upvote", to: 'posts#upvote', as: 'upvote'
  resources :bloggers
  resources :destinations
end
