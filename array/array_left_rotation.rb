#!/bin/ruby
# Function Description
# Complete the function rotLeft in the editor below. It should return the resulting array of integers.
#vrotLeft has the following parameter(s):
# An array of integers a.
# An integer d, the number of rotations.
require 'json'
require 'stringio'

# Complete the rotLeft function below.
def rotLeft(a, d)
    # easy ruby solution :-)
    # a.rotate(d)
    new_array = Array.new(a.length)
    a.each_with_index do |val, index| 
        new_index = index - d
        new_array[new_index] = val
    end
   new_array
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nd = gets.rstrip.split

n = nd[0].to_i

d = nd[1].to_i

a = gets.rstrip.split(' ').map(&:to_i)

result = rotLeft a, d

fptr.write result.join " "
fptr.write "\n"

fptr.close()