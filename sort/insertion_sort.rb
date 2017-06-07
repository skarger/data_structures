def  insertion_sort(ar) 
    n_sorted = 1
    while n_sorted < ar.length do
        e = ar[n_sorted]
        ar[0, n_sorted].each_with_index do |n, i|
            if n > e
                j = n_sorted
                while j > i
                    ar[j] = ar[j-1] 
                    puts ar.join(" ")
                    j -= 1
                end
                ar[i] = e
                puts ar.join(" ")
                break
            end
        end
        n_sorted += 1
    end
end
count = gets.to_i
ar = gets.strip.split.map {|i| i.to_i}

insertion_sort(ar)
