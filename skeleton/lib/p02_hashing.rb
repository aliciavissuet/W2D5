class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each {|num| total += total ^ num}
    total
  end
end

class String
  def hash
    total = 0
    self.chars.each do |char| 
    total += total ^ char.ord
    end
  total
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # arr = self.each.sort_by { |k,v| v }
    # [[:a, 1], [:b, 2], [:d, 4], [:c, 5]]
    arr = self.values.sort

    total = 0
    arr.each do |el|
      el = el.ord if el.is_a?(String)
      total += total ^ el
    end
    total
  end
end
