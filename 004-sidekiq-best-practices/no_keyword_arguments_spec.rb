require 'sidekiq/testing'
require_relative 'no_keyword_arguments'

RSpec.describe SomeWorker do
  around do |spec|
    Sidekiq::Testing.inline! { spec.run }
  end

  describe '#perform' do
    subject(:perform) { described_class.perform_async id: 1, timestamp: 2 }

    it 'does some work' do
      expect { perform }.not_to raise_error
    end
  end
end
