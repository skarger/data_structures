puts "In-place Quicksort"
puts "Enter input as 2 lines, where the first line has the list size and the second line has the space delimited numbers."
puts "Example:"
puts "5"
puts "3 1 9 8 5"

n = gets.strip.to_i
ar = gets.strip.split(" ").map(&:to_i)

def swap(ar, i, j)
    temp = ar[j]
    ar[j] = ar[i]
    ar[i] = temp    
end

def sort_sub_array(ar, lo, hi)
    pivot = ar[hi]
    i = lo
    j = lo

    while i < hi do
        val = ar[i]
        if val < pivot
            swap(ar, i, j)
            j += 1
        end 
        i += 1
    end    
    swap(ar, i, j)
    return [[lo, j - 1], [j + 1, hi]]
end

def quicksort(ar, lo, hi)
    if lo < hi
        smaller, larger = sort_sub_array(ar, lo, hi)
        puts ar.join(" ")
        quicksort(ar, smaller[0], smaller[1])
        quicksort(ar, larger[0], larger[1])
    end
end

quicksort(ar, 0, ar.length - 1)
