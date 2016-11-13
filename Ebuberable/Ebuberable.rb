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

  #Doesn`t work
  def reduce(num=1, memo)
    res = self.first # if num not passed https://blog.udemy.com/ruby-inject/
    self.drop(1).each do |item|
      res = res.public_send(memo, item)
    end
    res
  end

  def grep(pat, &block)
    arr = []
    self.each do |item|
      if (pat === item)
        res = block_given? ? yield(item) : item
        arr << res
      end
    end
    arr
  end

  def partition(&block)

  end

  def sort(&block)

  end
end
