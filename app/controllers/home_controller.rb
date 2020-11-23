class HomeController < ApplicationController
	 def index
	end
	 def usermailer
		User.all.each do |user|
		#debugger
		UserMailer.welcome_email(user).deliver_now
		   		flash[:notice] = "massege send your mail"

       end
   end
end
