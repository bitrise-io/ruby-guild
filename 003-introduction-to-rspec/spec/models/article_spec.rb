require 'rails_helper'

RSpec::Matchers.define :be_invalid_on do |expected|
  match do |record|
    record.invalid? && record.errors.has_key?(expected)
  end
end

RSpec.describe Article, type: :model do
  describe 'validation' do
    let(:article) { Article.new }

    it 'requires a #title' do
      article.title = nil

      expect(article).to be_invalid_on(:title)
    end

    it 'requires a #body' do
      article.body = nil

      expect(article).to be_invalid_on(:body)
    end
  end
end
