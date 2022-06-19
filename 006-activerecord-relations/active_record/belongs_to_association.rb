require_relative 'association'

class BelongsToAssociation < Association
  def reader
    klass = @reflection.klass
    primary_key = @reflection.primary_key
    foreign_key = @reflection.foreign_key

    if loaded?
      @target
    else
      self.target = klass.where(primary_key => @owner[foreign_key]).first
    end
  end

  def writer(record)
    primary_key = @reflection.primary_key
    foreign_key = @reflection.foreign_key

    @owner[foreign_key] = record[primary_key]
    self.target = record
  end
end
