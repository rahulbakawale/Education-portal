Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
    #resources :users, :profiles 
     resources :users 
     resources :jobs, only: %i[index new edit create update ]
   	 resources :profiles 
   	 resources :portfolios, only: %i[index create new update] do
   	   resource :comments, only: %i[new create]
   	   resources :likes, only: %i[index  new create]

   	end
   	   	   root to: "jobs#index"

       # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
