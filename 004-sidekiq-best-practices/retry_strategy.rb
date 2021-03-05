require 'sidekiq'

# This worker uses the default retry strategy: https://github.com/mperham/sidekiq/wiki/Error-Handling#automatic-job-retry
class WorkerWithDefaultRetries
  include Sidekiq::Worker

  def perform
    # Do some work
  end
end

class WorkerWithLimitedRetries
  include Sidekiq::Worker
  sidekiq_options retries: 10

  def perform
    # Do some work
  end
end

class WorkerWithLinearRetryStrategy
  include Sidekiq::Worker
  sidekiq_options retry: 10
  sidekiq_retry_in { 30 } # Retry every 30 seconds with no backoff

  def perform
    # Do some work
  end
end

class WorkerWithCustomRetryStrategy
  include Sidekiq::Worker
  sidekiq_options retry: 20
  sidekiq_retry_in { |count| count ** 2 + 15 + rand(30) }

  def perform
    # Do some work
  end
end

class WorkerWithRetriesExhaustedLogging
  include Sidekiq::Worker
  sidekiq_options retries: 10
  sidekiq_retries_exhausted { |msg, _ex| Sidekiq.logger.error "Out of retries: #{msg}" }

  def perform
    # Do some work
  end
end
