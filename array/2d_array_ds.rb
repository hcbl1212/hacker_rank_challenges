#!/bin/ruby
# Function Description
# Complete the function hourglassSum in the editor below. It should return an integer, the maximum hourglass sum in the array.

# hourglassSum has the following parameter(s):

# arr: an array of integers
require 'json'
require 'stringio'
# Essentially I just wanted to get it done on the first past of each row of the array
# Complete the hourglassSum function below.
def hourglassSum(arr)
    array_of_values = []
    arr.each_with_index do |row, index|
        ro = 0
        co = 1
        if index < 4
            while ro < 4 do
                array_of_values << sum_each_hourglass(arr, index, ro, co)
                ro += 1
                co += 1
            end
        end
    end
    array_of_values.max
end

def sum_each_hourglass(row, index, ro, co)
    hg_top, hg_mid, hg_bottom = row[index],row[index+1],row[index+2]
    hg_sum = hg_top[ro] + hg_top[ro+1] + hg_top[ro+2]
    hg_sum += hg_bottom[ro] + hg_bottom[ro+1] + hg_bottom[ro+2]
    hg_sum += hg_mid[co]
    hg_sum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

arr = Array.new(6)

6.times do |i|
    arr[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = hourglassSum arr

fptr.write result
fptr.write "\n"

fptr.close()