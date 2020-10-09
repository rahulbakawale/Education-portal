class FriendlistsController < ApplicationController

	def send_request
		@user = user.find(params[:user_id])
		@friendlist = @user.


      end

	def cancel_request
	  end

	def accepted_request
	  end
end
