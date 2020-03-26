Rails.application.routes.draw do
  resources :posts
  post "posts/:id/comment", to: "posts#create_comment", as: :comments
  delete "posts/:id/comment/:comment_id", to: "posts#delete_comment", as: :delete_comment
  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
