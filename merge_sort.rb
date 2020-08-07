rand_arr = Array.new(101) { rand 999 }
def merge_sort(arr)
  return arr unless arr.length > 1
  mid = arr.length / 2
  left_half = merge_sort(arr[0, mid])
  right_half = merge_sort(arr[mid..-1])

  # Merge process
  sorted_arr = []
  until left_half.empty? || right_half.empty?
    if left_half[0] < right_half[0]
      sorted_arr.push(left_half.shift)
    else
      sorted_arr.push(right_half.shift)
    end
  end
  # push the remaining sorted items of the non empty arr into the sorted arr
  sorted_arr.concat(left_half, right_half)
end

p merge_sort(rand_arr)
