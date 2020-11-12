class UserJob < ActiveJob::Base

  def perform
  	#debugger
  	UserJob.set(wait: 1.minutes).perform_later	
  end


