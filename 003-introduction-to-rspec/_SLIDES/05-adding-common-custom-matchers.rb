# rspec spec/models/article_spec.rb
it 'requires a #title' do
  article.title = nil

  # Note that we should aslo check that the corresponding enties have been added to article,errors if validation fails,
  # Both expectations test the same functionality but on multiple levels on the same object:
  expect(article).to be_invalid
  expect(article.errors).to have_key(:title)
end

it 'requires a #body' do
  article.body = nil

  # Note that we should aslo check that the corresponding enties have been added to article,errors if validation fails,
  # Both expectations test the same functionality but on multiple levels on the same object:
  expect(article).to be_invalid
  expect(article.errors).to have_key(:body)
end


# We could merge be_invlid and have_key expectations to a single matcher:
expect(article).to be_invalid_on(:title)
expect(article).to be_invalid_on(:body)

# This would try to invoke `invalid_on?` on the article object (which obviously does not exist)
# Instead of defining it in Article, create a custom matcher, this belongs to tests anyway and not in the model:
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
