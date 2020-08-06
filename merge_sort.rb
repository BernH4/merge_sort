require 'pry'
rand_arr = Array.new(100) { rand 500 }
# rand_arr = [8,5,9,7]
def merge_sort(arr)
  left_half  = arr[0, arr.length / 2]
  right_half = arr[arr.length / 2..-1]
  if arr.length > 1
    left_half = arr[0, arr.length / 2] = merge_sort(left_half)
    right_half = arr[arr.length / 2..-1] = merge_sort(right_half)
    left_i = 0
    right_i = 0
    new_arr = []
    # Merge process
    loop do
      if left_half[left_i] < right_half[right_i]
        new_arr << left_half[left_i]
        left_i += 1
        if left_i == left_half.length
          new_arr.push(*right_half[right_i..-1])
          break
        end
      else
        new_arr << right_half[right_i]
        right_i += 1
        if right_i == right_half.length
          new_arr.push(*left_half[left_i..-1])
          break
        end
      end
    end
    new_arr
  else
    arr
  end
end
puts "final result: \e[31m#{merge_sort(rand_arr)}\e[0m"
