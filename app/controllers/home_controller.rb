class HomeController < ApplicationController
	 def index
	end
	 def usermailer
		# debugger
         UserMailer.welcome_email(User).deliver_now
       end
end
