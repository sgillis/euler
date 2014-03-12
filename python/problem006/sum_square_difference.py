import sys

def square_of_sum(n):
  '''
  Calculate the square of the sum of the first n integers
  '''
  return (n*(n+1)/2)**2

def sum_of_squares(n):
  '''
  Calculate the sum of the squares of the first n integers
  '''
  # This sum can be rewritten:
  # http://www.wolframalpha.com/input/?i=Sum[k^2%2C{k%2C1%2Cn}]
  return n*(n+1)*(2*n+1)/6

def sum_square_difference(n):
  '''
  Calculate the difference between the square of the sum of the first n
  integers and the sum of the squares.
  '''
  return square_of_sum(n) - sum_of_squares(n)

if __name__=="__main__":
  print sum_square_difference(int(sys.argv[1]))
