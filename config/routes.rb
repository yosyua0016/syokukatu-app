Rails.application.routes.draw do
  devise_for :users
  root "posts#index" # トップページを設定
  get '/post_form', to: 'posts#new'
  resources :posts
  get 'categories/reduce_salt', to: 'posts#reduce_salt'
  get 'categories/reduce_sugar', to: 'posts#reduce_sugar'
  get 'categories/high_protein', to: 'posts#high_protein'
  get 'categories/obesity_prevention', to: 'posts#obesity_prevention'
  get 'categories/cold_prevention', to: 'posts#cold_prevention'
  get 'categories/others', to: 'posts#others'
end