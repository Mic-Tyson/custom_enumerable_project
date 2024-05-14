module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self
      yield elem
    end
  end

  def my_each_with_index
    i = 0
    for elem in self
      yield(elem, i)
      i += 1
    end
  end

  def my_all?
    success = true
    my_each { |elem| success = false unless yield(elem) }
    success
  end

  def my_any?
    success = false
    my_each { |elem| success = true if yield(elem)}
    success
  end

  def my_none?
    success = true
    my_each { |elem| success = false if yield(elem)}
    success
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each { |elem| count += 1 if yield(elem) }
    count
  end

  def my_map
    mapped_array = []
    my_each { |elem| mapped_array << yield(elem) }
    mapped_array
  end

  def my_inject(accumulator = 0)
    my_each { |elem| accumulator = yield(accumulator, elem) }
    accumulator
  end
  

end
