Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
   resources :items, only: [:index,:show]
   resources :cart_items, only: [:index,:update,:destroy,:create]
    delete '/cart_items' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
   resources :orders, only: [:index,:show,:new,:comfirm,:complete,:create]
   resources :deliveries, only: [:index,:edit,:create,:update,:destory,]
   resources :customers, only: [:show,:edit,:update,:unsubscribe,:withdraw]
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
