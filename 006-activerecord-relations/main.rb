# The original talk was given by Daniel Colson @ RailsConf2022 - hopefully this will be published soon
# https://twitter.com/dodecadaniel
#
# Check out his blog:
# https://danieljamescolson.com/blog/
#
# Check out the full source code at:
# https://github.com/rails/rails
#
# Or more specifically:
# https://github.com/rails/rails/blob/main/activerecord/lib/active_record/reflection.rb
# https://github.com/rails/rails/blob/main/activerecord/lib/active_record/associations.rb
# https://github.com/rails/rails/blob/main/activerecord/lib/active_record/associations/*.rb

require 'active_support/core_ext/string'
require_relative 'active_record/application_record'

class Build < ApplicationRecord
  belongs_to :repository

  # self.belongs_to(:repository)
  #
  # Provides a lot of methods and features:
  # - repository
  # - repository=(repository)
  # - build_repository
  # - create_repository
  # - create_repository!
  # - reload_repository
  # - repository_changed?
  # - repository_previously_changed?
  # + presence validation
  # + caching
  # + ...
end

class Repository < ApplicationRecord
  has_many :builds
end


def belongs_to_problems_without_caching(build)
  repo = build.repository
  #=> #<Repository:0x00007fc90a19adb8 @id=42>

  same_repo = build.repository
  #=> #<Repository:0x00007fadce18e6a0 @id=42>

  repo.name = 'new name'
  same_repo.name
  #=> 'old name'
end

def belongs_to_with_caching(build)
  repo = build.repository
  #=> #<Repository:0x00007fc90a19adb8 @id=42>

  same_repo = build.repository
  #=> #<Repository:0x00007fc90a19adb8 @id=42>

  repo.name = 'new name'
  same_repo.name
  #=> 'new name'
end

def has_many_problem_with_returning_arrays(repository)
  repository.builds
  # => SELECT * FROM builds WHERE repository_id = 42
  # => [ <#Build @repository_id=42> ]
  #
  # This is a simple array. We cannot call e.g. repository.builds.create ...
  # What we need is something like:
  # => <#ActiveRecord::Relation>
  #
  # The problem is caching. When we execute the query (e.g. by calling #to_a) of a relation
  # then we need to store the resulting objects in the association, but these two things
  # have no knowledge about each other => introducing CollectionProxy.
end

def problem_without_inverses(repository)
  builds = repository.builds
  # => SELECT * FROM builds WHERE repository_id = 42

  builds.map(&:repository)
  # => SELECT * FROM repositories WHERE id = 42 LIMIT 1
  # => SELECT * FROM repositories WHERE id = 42 LIMIT 1
  # => SELECT * FROM repositories WHERE id = 42 LIMIT 1
  # => SELECT * FROM repositories WHERE id = 42 LIMIT 1
  #
  # Same data inconsistency problem we had without association caching.
end
