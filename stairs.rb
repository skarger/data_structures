#!/bin/ruby

n = gets.strip.to_i

def stair(n, cur)
    leading_spaces = cur - 1
    " " * leading_spaces + "#" * (n - leading_spaces)
end

def stairs(higher, n, cur)
    if cur == 1
       higher.push(stair(n, 1))
    else
        stairs(higher.push(stair(n, cur)), n, cur-1)
    end
end

if n <= 0
    return
else
    puts stairs([], n, n).join("\n")
end
