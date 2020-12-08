Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  
 #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 devise_for :users, :controllers => { :registrations => "registrations",omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :orders, :new => { :express => :get }

      get 'express/new/orders' => 'orders#express', :as => :express_new_order

      get '/friendlists/send_request/:friend_id' => 'friendlists#send_request', :as => :send_request
      get '/friendlists/accepted_request/:friend_id' =>'friendlists#accepted_request', :as => :accepted_request
     #get '/friendlists/cancel_request/:friend_id' =>'friendlists#cancel_request', as: :cancel_request
      delete '/friendlists/cancel_request/:id' =>'friendlists#cancel_request', :as => :cancel_request
      get '/friendlists/notifications' => 'friendlists#notifications', :as => :notifications
      get '/home/usermailer' => 'home#usermailer', as: 'usermailer'
 
      resources :posts, :only => %i[ index new create destroy] do 
      resources :reviews
        end 
   	   resources :profiles, :only => %i[index edit  show update new create ]
         resources :portfolios, :only => %i[index create new update] 
           resources :jobs, :only => %i[index new edit create update] do         
   	       resources :comments
   	    resources :likes, :only => %i[create destroy]

   	end
    root :to => "jobs#index"


    # APi Routing 

  namespace :api, defaults: { format: :json } do
    namespace :v1 do 

      #post 'auth/sign_in' => 'session#create'
        mount_devise_token_auth_for 'User', at: 'auth',controllers: {
        sessions:  'api/v1/sessions'
      }
      resources :orders
    end
  end
end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api
#problem for the token
#https://stackoverflow.com/questions/39191779/devise-token-auth-how-to-identify-a-user-by-token