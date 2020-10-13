class FriendlistsController < ApplicationController

	def send_request
		#debugger
		friendlist = current_user.friendlists.new(friend_id: params[:friend_id], status: 'Pending')
		friendlist.save
		flash[:notice] = "Friend requset send"
		redirect_to profiles_path

      end
	def cancel_request
		#debugger
		friendlist = Friendlist.find(params[:id])
		friendlist.destroy
		flash[:notice] = "Request Cancle"
		redirect_to profiles_path
		
	  end

	def accepted_request
		friendlist = Friendlist.find(params[:friend_id])
		friendlist.update(status: 'Accepted') if friendlist
		flash[:notice] = "Requset Accepted"
		redirect_to notifications_path

	end

   def notifications
   	    @requests = Friendlist.where(friend_id: current_user.id, status: 'Pending')
   end
end

      