# Super-powered array of records or a "SQL query waiting to happen"
class Relation
# - lazy-loading
#   - building queries, chaining filters, etc.
#   - iterating over records
#   - ...
# - creating new records
# - ...
#
# Build.where(finished_at > 1.week.ago)
# => <#ActiveRecord::Relation>
end
