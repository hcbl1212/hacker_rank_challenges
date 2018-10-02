#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumSwaps function below.
def minimumSwaps(arr)
    # stash length
    length = arr.length
    # this is an array
    array_position = []
    visited_array = []
    answer = 0
    arr.each_with_index do |val, index|
        array_position << Hash[val, index] 
        visited_array << false
    end
    # sort this by the original values to get the position in the new array
    array_position.sort! { |node, node2| node.keys.first <=> node2.keys.first }
    # node i to node j if the element at i’th index must be present at j’th index in the sorted array.
    # [4, 3, 1, 2]
    # [{1=>2}, {2=>3}, {3=>1}, {4=>0}]
    (0...length).each do |index|
        # if already visited OR the this is already in the position
        # this works because we sorted the array
        next if visited_array[index] || array_position[index].values.first == index
        cycle_size = 0
        start_index = index 
        while !visited_array[start_index]
            # visiting the node so mark it true
            visited_array[start_index] = true
            start_index = array_position[start_index].values.first
            cycle_size += 1
        end
        
        answer += (cycle_size - 1) if cycle_size > 0
    end
    answer
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

arr = gets.rstrip.split(' ').map(&:to_i)

res = minimumSwaps arr

fptr.write res
fptr.write "\n"

fptr.close()