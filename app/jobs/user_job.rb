class UserJob < ActiveJob::Base

  def perform
  	debugger
  	UserJob.set(wait: 1.minutes).perform_later
  	 t = Time.now
	  sleep(t + 1 - Time.now)
  end
end



