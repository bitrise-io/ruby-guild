class Association
  def initialize(owner, reflection)
    @owner = owner
    @reflection = reflection
    @loaded = false
    @target = nil
  end

  # Without caching
  #
  # def reader
  #   klass = @reflection.klass
  #   primary_key = @reflection.primary_key
  #   foreign_key = @reflection.foreign_key
  #
  #   klass.where(primary_key => @owner[foreign_key]).first
  # end
  #
  # def writer(record)
  #   primary_key = @reflection.primary_key
  #   foreign_key = @reflection.foreign_key
  #
  #   @owner[foreign_key] = record[primary_key]
  # end

  def reader
    klass = @reflection.klass
    primary_key = @reflection.primary_key
    foreign_key = @reflection.foreign_key

    if @loaded
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

  def loaded?
    @loaded
  end

  def target=(target)
    @target = target
    @loaded = true
  end
end
