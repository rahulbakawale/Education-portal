class Api::V1::ApiController < ApplicationController
	skip_before_action :authenticate_user!
    before_action :authenticate_api_user!
	#before_action :http_auth_header	
	

	def authenticate_api_user!
		#debugger
		#debugger
		if(request.headers['Authorization'])
			user = User.find(request.headers['Authorization'])  rescue nil
			if(!user)
				render json: { error: 'unauthorization'},status: 400
			end
		else
			render json: { error: 'Token is missing'},status: 400
		end
	end
 
end

