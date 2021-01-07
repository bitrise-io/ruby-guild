# Into to to RSpec - "Making TDD Productive and Fun"

# install in the gem env
`gem install rspec`

# Or add to a Rails app:
group :development, :test do
  gem 'rspec-rails', '~> 4.0.1'
end

# RSpec/Rails hooks into the Rails framework and provides handy generators
# ❯ rails g
#
# Rspec:
#   rspec:channel
#   rspec:controller
#   rspec:feature
#   rspec:generator
#   rspec:helper
#   rspec:install
#   rspec:integration
#   rspec:job
#   rspec:mailbox
#   rspec:mailer
#   rspec:model
#   rspec:request
#   rspec:scaffold
#   rspec:system
#   rspec:view

# Run rspec:install

# ❯ rails g rspec:install
# Running via Spring preloader in process 17661
#       create  .rspec
#       create  spec
#       create  spec/spec_helper.rb
#       create  spec/rails_helper.rb

# Verify rspec install by running rake
# ❯ rake
# No examples found.
#
# Finished in 0.00033 seconds (files took 0.113 seconds to load)
# 0 examples, 0 failures
