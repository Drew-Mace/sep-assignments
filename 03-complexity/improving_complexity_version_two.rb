require_relative '../02-algorithms/sort/merge_sort' 
# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby_time(*arrays)
 combined_array = []
 arrays.each do |value|
     combined_array << value
 end
 combined_array.flatten!  
 merge_sort(combined_array)
end