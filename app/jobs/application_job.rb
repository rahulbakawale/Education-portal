class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
def perform
  	debugger
  	UserJob.delay(run_at: 1.minutes.from_now).perform_later
  	UserJob.set(wait: 1.minutes).perform_now

  end