# Introducing the concept of let
# let runs once per it block ONLY IF called
# memoizes, similar to
#
# def article
#   @article ||= Article.create(title: 'My article')
# end
#
# Useful in long running methods, complex SQL queries, etc.

# spec/models/article_spec.rb
RSpec.describe Article, type: :model do
  describe 'validation' do
    let(:article) { Article.new }

    it 'requires a #title' do
      article.title = nil

      expect(article).to be_invalid
    end

    it 'requires a #body' do
      article.body = nil

      expect(article).to be_invalid
    end
  end
end

# Intorduce the concept of subject() and subject!()
# subject(:name_of_subject) signals what we are testing in the block
# invoke name_of_subject in your tests, give the subject an expressive name

# Improve GET index, intorduce subject
# spec/requests/article_spec.rb
describe "GET /index" do
  subject(:get_articles_url) { get articles_url }

  it "renders a successful response" do
    get_articles_url
    expect(response).to be_successful
  end
end

# Or with subject!() - note the ! in the method
# subject!(:name_of_subject) is ran automatically without it having to be invoked
describe "GET /index" do
  subject!(:get_articles_url) { get articles_url }

  it "renders a successful response" do
    expect(response).to be_successful
  end
end

# Improve GET index, intorduce contexts article_request_spec.rb

# Use describe when testing a method or a 'feature'
# Use contexts nested under describes to separate different cases
# Recommendation: Before writing any tests, always do o braindump first, think about what are the dependencies of your test, write them down
# This drives contexts and corresponding let parameters nested under them.
# In the following example, tests are set up almost identically, the only difference is what parameters the requests are invoked with:
# - article_param becomes the only difference in beetween contexts, so we extract it out into a let() {} block so that they are used individually in each context
# Result: Improves clarity, understainding of dependencies of the unit you are testing

describe "GET /show" do
  subject(:get_article_url) { get article_url(article_param) }

  let(:article) { Article.create! valid_attributes }

  context 'with valid params' do
    let(:article_param) { article.to_param }

    it "renders a successful response" do
      get_article_url
      expect(response).to be_successful
    end
  end

  context 'with invalid params' do
    let(:article_param) { 'missing-article' }

    it 'raises an ActiveRecord::RecordNotFound error' do
      expect { get_article_url}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

describe "POST /create" do
  context "with valid parameters" do
    subject(:post_articles_url) do
      post articles_url, params: { article: article_parameters }
    end

    context 'with valid parameters' do
      let(:article_parameters) do
        {
          title: 'My article',
          body: 'This is a demo'
        }
      end

      it "creates a new Article" do
        expect { post_articles_url }.to change(Article, :count).by(1)
      end

      it "redirects to the created article" do
        post_articles_url
        expect(response).to redirect_to(article_url(Article.last))
      end
    end

    context 'with invalid parameters' do
      let(:article_parameters) do
        {
          title: 'My article',
          body: nil
        }
      end

      # The change method is mapped to amn RSpec matcher, lives in rspec-expectations BuiltIn::Change matcher class:
      # def change(receiver=nil, message=nil, &block)
      #   BuiltIn::Change.new(receiver, message, &block)
      # end
      it "does NOT create a new Article" do
        expect { post_articles_url }.to_not change { Article.count }

        # Can be also written as:
        # expect { post_articles_url }.to_not change(Article, :count)
        # expect { post_articles_url }.not_to change { Article.count }
      end
    end
  end
end
