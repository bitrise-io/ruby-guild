class AccountEventWorker
  include Sidekiq::Worker

  def perform(id, name)
    account = Account.find id
    account.update name: name
  rescue StandardError => ex
    Sidekiq::Logging.logger.error "Exception: #{ex}"
  end
end


class AccountEventWorker2
  include Sidekiq::Worker

  def perform(id, name)
    account = Account.find id
    account.update name: name
  rescue ActiveRecord::RecordNotFound => ex
    logger.warn "Exception: #{ex}"
  end
end

# 1. Sidekiq will catch and log all errors that `perform` raises automatically. The difference is, if
#    the error gets to Sidekiq then the worker will be automatically retried.
#
# 2. Catching and not reraising StandardError means that we have given up on this block of work.
#    There will be no retry so even if we fix the error that made the worker fail in the first place,
#    the worker will have to be rescheduled manually or else the work will be lost.
#
# 3. All Sidekiq workers have access to the Sidekiq logger via the `logger` method.
