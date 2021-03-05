# https://github.com/mperham/sidekiq/wiki/Best-Practices

require 'sidekiq'
require 'sidekiq/testing'

Sidekiq::Testing.inline!

class SomeWorker
  include Sidekiq::Worker

  def perform(time, misc)
    p time, misc
  end
end

SomeWorker.perform_async Time.now, { id: 1 }

# => "2021-03-05 11:36:29 +0100"     -> this is a String, not a Time
#    {"id"=>1}                       -> the hash has String keys, not Symbols



# The issue is a slightly different when it comes to Mailers but the recommendation still stands!

class MySuperMailer < ActionMailer::Base
  def welcome_email(user)
    mail to: user.email, subject: 'Üdvözöllek dicső lovag!'
  end
end

MySuperMailer.delay.welcome_email(user)
# MySuperMailer.with(user: user).welcome_email.deliver_later


class MyBetterMailer < ActionMailer::Base
  def welcome_email(user_id)
    user = User.find user_id
    mail to: user.email, subject: 'Üdvözöllek dicső lovag!'
  end
end

MySuperMailer.delay.welcome_email(user.id)
