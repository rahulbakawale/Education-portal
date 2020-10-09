
Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
     resources :users  do
      resources :friendlists
        #resource :friendlists, only: %i[send_request accepted_request cancel_request]
      end
   	   resources :profiles, only: %i[edit  show update new create ]
         resources :portfolios, only: %i[index create new update] 
           resources :jobs, only: %i[index new edit create update ] do
   	       resources :comments
   	    resources :likes, only: %i[create destroy]

   	end
     root to: "jobs#index"

       # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
