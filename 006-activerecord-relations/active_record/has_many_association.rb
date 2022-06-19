require_relative 'association'
require_relative 'collection_proxy'

class HasManyAssociation < Association
  # Returning an array of records, instead of a Relation
  #
  # def reader
  #   klass = @reflection.klass
  #   primary_key = @reflection.primary_key
  #   foreign_key = @reflection.foreign_key
  #
  #   if loaded?
  #     @target
  #   else
  #     self.target = klass.where(foreign_key => @owner[primary_key]).to_a
  #   end
  # end

  def reader
    CollectionProxy.new(self)
  end

  # Without inverse caching
  #
  # def load_target
  #   klass = @reflection.klass
  #   primary_key = @reflection.primary_key
  #   foreign_key = @reflection.foreign_key
  #
  #   if loaded?
  #     @target
  #   else
  #     self.target = klass.where(foreign_key => @owner[primary_key]).to_a
  #   end
  # end

  # With inverse caching
  #
  def load_target
    klass = @reflection.klass
    primary_key = @reflection.primary_key
    foreign_key = @reflection.foreign_key

    if loaded?
      @target
    else
      self.target = klass.where(foreign_key => @owner[primary_key]).to_a
      @target.each do |record|
        association = record.association(@reflection.inverse_name)
        association.target = @owner
      end
    end
  end
end
