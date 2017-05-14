nums = [1, 4, 2, 4]
maxes = [3, 5]

def count(nums, maxes)
  nums.sort!.reverse!
  max_counts = []
  j = 0
  maxes.reverse.each do |maxes_i|
    while nums[j] > maxes_i
      j += 1
    end
    max_counts.unshift [nums.length - j, 0].max
  end

  max_counts
end

puts count(nums, maxes)
