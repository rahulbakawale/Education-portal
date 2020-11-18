class UserJob < ActiveJob::Base
	def	perform
		User.all.each do |user|
		debugger
			UserMailer.welcome_email(user).deliver_now
	    	#UserJob.set(wait: 1.minutes).perform_now
		end
	    #UserJob.set(wait_untill: <14/11/2020>).perform_later
	end
  end


  #UserJob.set(wait: 1.minutes).perform_now
  #UserJob.delay(run_at: 1.minutes.from_now).perform_later
