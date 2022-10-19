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
   resources :deliveries, only: [:index,:edit,:create,:update,:destory,]
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
