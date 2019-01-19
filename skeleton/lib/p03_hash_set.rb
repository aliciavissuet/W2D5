# require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets-1 
    unless include?(key)
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    return false unless self[key].include?(key)
    true
  end

  def remove(key)
     if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`

    @store[num.hash % num_buckets] #hash doesn't exist here
  end

  def num_buckets
    @store.length
  end

  def resize!
    # this is an empty method ... 
  end
end
