import sys
sys.path.append('../problem003')
from largest_prime import is_prime

def find_primes(n):
  '''
  Find the nth first prime numbers
  '''
  primes = [2]
  i = 3
  while len(primes)<n:
    if is_prime(i):
      primes.append(i)
    i += 2
  return primes

if __name__=="__main__":
  print find_primes(int(sys.argv[1]))[-1]
