# nice ways to:
# create a sequence of even/odds
# swap array elements in one line
def wave(a)
    a.sort!
    max_idx = a.length - 1
    evens = Range.new(0, max_idx)
    odds = Range.new(1, max_idx)
    evens.step(2).zip(odds.step(2)).each do |pair|
        pair.compact!
        a[pair.first], a[pair.last] = a[pair.last], a[pair.first]
    end
    a
end
