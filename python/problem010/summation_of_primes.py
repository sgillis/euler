import sys
sys.path.append('../problem003')
from largest_prime import is_prime

def main(n):
  """Return the sum of all the primes below n"""
  i = 3
  s = 2
  while i<n:
    if is_prime(i):
      s += i
    i += 2
  return s

if __name__ == '__main__':
  print(main(2000000))
