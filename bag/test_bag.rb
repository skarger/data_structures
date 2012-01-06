# run some tests on Bag class

require "Bag"
require "test/unit"

class TestBag < Test::Unit::TestCase

    def setup
        @b = Bag.new
    end

    def test_num_items
        assert_equal(0, @b.num_items)
        @b.add("summer")
        assert_equal(1, @b.num_items)
        @b.remove("summer")
        assert_equal(0, @b.num_items)
    end

    def test_add
        @b.add("summer")
        @b.add("winter")
        @b.add(5)
        assert(@b.contains("summer"))
        assert(@b.contains("winter"))
        assert(@b.contains(5))
        assert_equal(3, @b.num_items)
    end

    def test_remove
        @b.add("summer")
        @b.add("winter")
        @b.add(5)
        assert(@b.contains("winter"))
        @b.remove("winter")
        assert(!@b.contains("winter"))
        assert_equal(2,@b.num_items)
        @b.remove("blue")
        assert_equal(2,@b.num_items)
    end

    def test_grab
        @b.add("summer")
        @b.add("winter")
        @b.add(5)
        grabbed = Array.new
        50.times {g = @b.grab; grabbed.push(g) if grabbed.index(g) == nil}
        assert(grabbed.length > 1)
    end

    def test_contains
        @b.add("summer")
        assert(@b.contains("summer"))
        assert(!@b.contains("blue"))
    end

    def test_to_array
        @b.add("summer")
        @b.add("winter")
        @b.add(5)
        arr = @b.to_array
        assert_not_nil(arr.index("summer"))
        assert_not_nil(arr.index("winter"))
        assert_not_nil(arr.index(5))
        assert_equal(3, arr.length)
    end

    def teardown
        # nothing
    end
end
