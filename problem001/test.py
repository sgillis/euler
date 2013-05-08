'''
Test for multiples.py
'''

import unittest
import multiples

class MultiplesTest(unittest.TestCase):
  def test_multiples_sum(self):
    self.assertTrue(multiples.multiples_sum(10)==23)
    self.assertTrue(multiples.multiples_sum(1000)==233168)

if __name__=="__main__":
  unittest.main()
