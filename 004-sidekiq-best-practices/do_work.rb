class SomeWorker
  include Sidekiq::Worker

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      do_work
    end
  end

  private

  def do_work
    # Do some work
  end
end

# The form above does work but it's 100% equivalent to the form below

class SomeWorkerEquivalent
  include Sidekiq::Worker

  def perform
    # Do some work
  end
end
