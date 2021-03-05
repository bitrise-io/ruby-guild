require 'sidekiq'

class LoggingWorker
  include Sidekiq::Worker

  def perform
    logger.info "Hi'ya!"
  end
end
