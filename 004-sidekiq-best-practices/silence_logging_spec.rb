require 'sidekiq/testing'
require 'sidekiq/logging/json'
require_relative 'silence_logging'

RSpec.configure do |config|
  config.around :example, :silence_sidekiq_logging do |spec|
    log_level = Sidekiq.logger.level
    Sidekiq.logger.level = Logger::FATAL
    spec.run
  ensure
    Sidekiq.logger.level = log_level
  end
end


RSpec.describe LoggingWorker do
  describe '#perform' do
    subject(:perform) { described_class.new.perform }

    it 'logs a message' do
      perform
    end

    it 'logs an expected message' do
      expect(Sidekiq.logger).to receive(:info).with("Hi'ya!")
      perform
    end

    it 'does not log a message', :silence_sidekiq_logging do
      perform
    end
  end
end
