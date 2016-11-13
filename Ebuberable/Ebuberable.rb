module Ebuberable
  def select(&block)
    arr = []
    self.each do |item|
      if yield (item)
        arr << item
      end
    end
    arr
  end

  def reject(&block)
    arr = []
    self.each do |item|
      unless yield (item)
        arr << item
      end
    end
    arr
  end

  def all?(&block)
    result = true
    self.each do |item|
      unless yield (item)
        result = false
      end
    end
    result
  end

  def any?(&block)
    result = false
    self.each do |item|
      if yield (item)
        result = true
      end
    end
    result
  end

  def find(&block)
    result = nil
    self.each do |item|
      if yield (item)
        result = item
        break
      end
    end
  end

  def map(&block)
    arr = []
    self.each do |item|
      s = yield (item)
      arr << s
    end
    arr
  end

  #accumulator shouldn't be required (needed to fix)
  def reduces(accumulator, operation = nil, &block)
    if !operation && !block
      raise ArgumentError, "no block given"
    end

    block = case operation
      when nil
        block
      else
        lambda { |acc,value| acc.send(operation, value) }
      end

    self.each do |item|
      accumulator = block.call(accumulator, item)
    end
      accumulator
  end

  def partition(&block)

  end

  def sort(&block)

  end
end
