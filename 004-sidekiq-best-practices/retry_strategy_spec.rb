require 'sidekiq/testing'
require 'active_support/core_ext/integer/time'
require_relative 'retry_strategy'

RSpec.shared_examples 'Sidekiq worker' do
  subject(:worker) { described_class.new }
  let(:sidekiq_options) { described_class.sidekiq_options }

  it { is_expected.to be_a Sidekiq::Worker }

  describe '.sidekiq_options' do
    subject { sidekiq_options }
    let(:expected_worker_options) { {} }

    it { is_expected.to include expected_worker_options }
  end

  def total_retry_interval
    return nil unless sidekiq_options['retry'].is_a? Integer
    (1..sidekiq_options['retry']).map { |i| described_class.sidekiq_retry_in_block.call(i) }.sum
  end
end


RSpec.describe WorkerWithCustomRetryStrategy do
  include_examples 'Sidekiq worker' do
    let(:expected_worker_options) { {'retry' => 20} }

    it 'retries for about an hour' do
      expect(total_retry_interval).to be_between 50.minutes, 1.hour
    end
  end
end
