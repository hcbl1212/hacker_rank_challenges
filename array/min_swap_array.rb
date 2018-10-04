#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumSwaps function below.
def minimumSwaps(arr)
    # You are given an unordered array consisting of consecutive integers  [1, 2, 3, ..., n] without any duplicates, get min swaps
    # logic here is to convert the array to a graph
    # where each node is structured as such
    # if the original array is this [1, 3, 5, 2, 4, 6, 8]
    # then the graph is  [{1=>0}, {2=>3}, {3=>1}, {4=>4}, {5=>2}, {6=>5}, {8=>6}]
    # What we are trying to do is sum up the cycles 
    # (non intersecting because of the nature of the data)
    # we visit each node and then count each visit which will actually
    # tell us the minimum amount of swaps!
    length = arr.length
    array_position = []
    visited_array = []
    answer = 0
    arr.each_with_index do |val, index|
        # creating the graph node
        array_position << Hash[val, index] 
        visited_array << false
    end
    # sort this by the original values to get the position in the new array
    array_position.sort! { |node, node2| node.keys.first <=> node2.keys.first }
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
