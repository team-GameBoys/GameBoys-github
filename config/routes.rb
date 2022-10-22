Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
   resources :items, only: [:index,:show]
   resources :cart_items, only: [:index,:update,:destroy_all,:destroy,:create]
   resources :orders, only: [:index,:show,:new,:comfirm,:complete,:create]
   resources :deliveries, only: [:index,:edit,:create,:update,:destroy,]
   get "customers/my_page" => "customers#show", as: "my_page"
   get "customers/my_page/edit" => "customers#edit", as: "edit"
   patch "customers/customers" => "customers#update", as: "update"
   # 退会確認画面
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  end

  namespace :admin do
   resources :genres, only: [:index,:create,:edit,:update]
   resources :items, only: [:index,:new,:create,:show,:edit,:update]
   resources :customers, only: [:index,:show,:edit,:update]
   resources :orders, only: [:show,:update]
   resources :making_statuses, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
