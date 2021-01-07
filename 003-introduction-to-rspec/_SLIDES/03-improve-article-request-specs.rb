# spec/requests/article_spec.rb
# Replace skip with real attributes
let(:valid_attributes) {
  {
    title: 'My article',
    body: 'This is a demo'
  }
}

let(:invalid_attributes) {
  valid_attributes.except(:title)
}

# spec/models/article_spec.rb
RSpec.describe Article, type: :model do
  describe 'validation' do
    it 'requires a #title' do
      article = Article.new
      article.title = nil

      expect(article.valid?).to be false
    end

    it 'requires a #body' do
      article = Article.new
      article.body = nil

      expect(article.valid?).to be false
    end
  end
end

# article.rb
class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
end

# Improve readability

RSpec.describe Article, type: :model do
  describe 'validation' do
    it 'requires a #title' do
      # article = Article.new
      # article.title = nil

      # Predicate Matcher, translates to article.invalid?
      expect(article).to be_invalid
    end

    it 'requires a #body' do
      # article = Article.new
      # article.body = nil

      # Predicate Matcher, translates to article.invalid?
      expect(article).to be_invalid
    end
  end
end

# Built-in matchers

# - Equivalence
# expect(actual).to eq(expected)  # passes if actual == expected

# - Identity
# expect(actual).to be(expected)    # passes if actual.equal?(expected)
# expect(actual).to equal(expected) # passes if actual.equal?(expected)

# - Comparisons
# expect(actual).to be >  expected

# - Types/classes
# expect(actual).to be_an_instance_of(expected) # passes if actual.class == expected
# expect(actual).to be_a(expected)              # passes if actual.kind_of?(expected)
# expect(actual).to be_an(expected)             # an alias for be_a

# - Truthiness
# expect(actual).to be_truthy   # passes if actual is truthy (not nil or false)
# expect(actual).to be true     # passes if actual == true
# expect(actual).to be_falsy    # passes if actual is falsy (nil or false)
# expect(actual).to be false    # passes if actual == false
# expect(actual).to be_nil      # passes if actual is nil
# expect(actual).to_not be_nil  # passes if actual is not nil

# - Errors
# expect { ... }.to raise_error
# expect { ... }.to raise_error(ErrorClass)
# expect { ... }.to raise_error("message")
# expect { ... }.to raise_error(ErrorClass, "message")

# ... and more https://github.com/rspec/rspec-expectations
