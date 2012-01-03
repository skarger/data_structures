import bag
import unittest

class TestBag(unittest.TestCase):
    def setUp(self):
        self.b = bag.Bag()

    def tearDown(self):
        del self.b

    def test_num_items(self):
        self.assertEqual(self.b.num_items(), 0)
        self.b.add("summer")
        self.assertEqual(self.b.num_items(), 1)
        x = self.b.grab() # grabbing does not remove
        self.assertEqual(self.b.num_items(), 1)
        self.b.add("winter")
        self.assertEqual(self.b.num_items(), 2)
        self.b.remove("summer")
        self.assertEqual(self.b.num_items(), 1)
        
    def test_add(self):
        # when you have only one element, grabbing should return it
        self.b.add("summer")
        self.assertTrue(self.b.grab() == "summer")
        self.b.remove("summer")
        self.b.add(555)
        self.assertTrue(self.b.grab() == 555)

    def test_remove(self):
        # when you remove the only element there should be none left
        self.b.add("summer")
        self.b.remove("summer")
        self.assertEqual(self.b.num_items(),0)

    def test_contains(self):
        self.assertFalse(self.b.contains("summer"))
        self.b.add("summer")
        self.assertTrue(self.b.contains("summer"))

    def test_grab(self):
        # with 3 items in the bag, enough grabs ought to return different items
        # the number of items should never change
        self.b.add("summer")
        self.b.add("winter")
        self.b.add(555)
        self.assertEqual(self.b.num_items(), 3)
        grabbed = []
        for i in range(50):
            x = self.b.grab()
            if x not in grabbed:
                grabbed.append(x)

        self.assertTrue(len(grabbed)) > 1          
        self.assertEqual(self.b.num_items(), 3)

    def test_to_array(self):
        # the length of returned array should match num_items
        # something grabbed should be in the array
        self.b.add("summer")
        self.b.add("winter")
        self.b.add(555)
        arr = self.b.to_array()
        self.assertEqual(self.b.num_items(), len(arr))
        self.assertTrue(self.b.grab() in arr)


if __name__ == '__main__':
    unittest.main()

