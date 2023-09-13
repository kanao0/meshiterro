Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/homes/about', to: 'homes#about', as: 'about'  
  # ルーティング一括設定new,index,showだけ
  resources :post_images, only: [:new,:create, :index, :show, :destroy]
  resources :users, only: [:show, :edit]  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
