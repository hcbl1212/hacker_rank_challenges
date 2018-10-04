#!/bin/ruby

require 'json'
require 'stringio'

# Complete the arrayManipulation function below.
def arrayManipulation(n, queries)
    # we can use a prefix sum array here 
    # https://wcipeg.com/wiki/Prefix_sum_array_and_difference_array
    # Given an array of numbers A and an arbitrary constant c, 
    # we first append c onto the front of the array, 
    # and then replace each element with the sum of itself and all the elements preceding it.
    
    # adding an extra element at the beginning and initializing it to zero 
    # effectively makes c = 0
    prefix_sum_array = Array.new(n + 1, 0)
    
    queries.each do |query|
        bi, ei, val = query
        prefix_sum_array[bi - 1] += val
        prefix_sum_array[ei] -= val
    end
    puts prefix_sum_array.inspect
    tmp = max = 0
    #replace each element with the sum of itself and all the elements preceding it.
    prefix_sum_array.each do |val|
        tmp += val
        max = tmp if tmp > max
    end
    max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nm = gets.rstrip.split

n = nm[0].to_i

m = nm[1].to_i

queries = Array.new(m)

m.times do |i|
    queries[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = arrayManipulation n, queries

fptr.write result
fptr.write "\n"

fptr.close()
