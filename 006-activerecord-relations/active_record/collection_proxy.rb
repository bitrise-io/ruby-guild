require_relative 'relation'

class CollectionProxy < Relation
  def initialize(association)
    @association = association
    super
  end

  def to_a
    @association.load_target
  end

  def create(attributes)
    # create a new record via @association so the cache is updated
  end
end
