'''
Calculate the sum of all the even valued Fibonacci numbers not exceeding n
'''

import sys

def fibonacci(n):
  '''
  Return a list of the Fibonacci numbers smaller than n
  '''
  fibonaccis = [1,2]
  while (fibonaccis[-1]+fibonaccis[-2])<n:
    fibonaccis.append( fibonaccis[-2]+fibonaccis[-1] )
  return fibonaccis

def even_fibonacci_sum(n):
  '''
  Return the sum of all even valued Fibonacci numbers not exceeding n
  '''
  return sum(i for i in fibonacci(n) if i%2==0)

if __name__=="__main__":
  print even_fibonacci_sum(int(sys.argv[1]))
