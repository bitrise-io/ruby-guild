require 'sidekiq'

class SomeWorker
  include Sidekiq::Worker

  def perform(id:, timestamp:)
    # Do some work
  end
end

# SomeWorker.perform_async id: 1, timestamp: Time.now.to_i
# => wrong number of arguments (given 1, expected 0; required keywords: id, timestamp) (ArgumentError)

# We're not calling perform with keyword arguments, we're passing in a hash to perform_async!
