import sys
import math

def is_prime(n):
  '''
  Decide if a number is prime
  '''
  for i in range(2, int(math.sqrt(n)+1) ):
    if n%i == 0:
      return False
  return True

def prime_factorization(n):
  '''
  Return prime factors of n
  '''
  i = 2
  while i < int(n/2)+1:
    if n%i == 0 and is_prime(i):
      return [i]+prime_factorization(n/i)
    i += 1
  return [n]

def largest_prime(n):
  '''
  Return largest prime factor of n
  '''
  return prime_factorization(n)[-1]

if __name__=="__main__":
  print largest_prime(int(sys.argv[1]))
