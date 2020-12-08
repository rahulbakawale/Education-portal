class Api::V1::ApiController < ApplicationController

	before_action :authenticate_api_user!
    #before_action :authenticate_api_user!

	def authenticate_api_user!
		#debugger
		#debugger
		auth_token = request.headers["auth-token"]
		token_type = request.headers["token-type"]
		client = request.headers["client"]
		expiry = request.headers["expiry"]
		uid = request.headers['uid']
		user = User.find_by_uid(uid)
		if !user || !user.valid_token?(auth_token, client)
		  render json: {error: "Usuario no autorizado."}, status: 401
		end
		
	end

	def current_user
		#debugger
		auth_token = request.headers["auth-token"]
		token_type = request.headers["token-type"]
		client = request.headers["client"]
		expiry = request.headers["expiry"]
		uid = request.headers['uid']
		user = User.find_by_uid(uid)
		if !user || !user.valid_token?(auth_token, client)
		  return nil #render json: {error: "Usuario no autorizado."}, status: 401
		else
			return user
		end
		
	end
 
end


#http://blog.magmalabs.io/2018/07/03/use-devise-devise_token_auth.html
##https://dev.to/risafj/guide-to-devisetokenauth-simple-authentication-in-rails-api-pfj