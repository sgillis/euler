import sys
sys.path.append('../problem003')
from largest_prime import is_prime
from largest_prime import prime_factorization

def merge(d1, d2, merge=lambda x,y: max(x, y)):
  '''
  Merge two dictionaries, combining values on duplicate keys 
  as defined by the merge function.
  Credit to: http://stackoverflow.com/a/44512
  '''
  result = d1
  for k, v in d2.iteritems():
    if k in result:
      result[k] = merge(result[k], v)
    else:
      result[k] = v
  return result

def lcm_factorization(n):
  '''
  Return the prime numbers and their multiplicity to compute the 
  smallest multiple of all numbers from 1 to n. Explained in more 
  detail on:
  http://en.wikipedia.org/wiki/Least_common_multiple#Finding_least_common_multiples_by_prime_factorization
  '''
  # Find all factorizations of all numbers between 2 and n, and convert
  # it to dicts:
  # [2,3,3,5] => {2: 1, 3:2, 5:1}
  factorizations = [ dict( (j, prime_factorization(i).count(j)) 
                           for j in prime_factorization(i) ) 
                     for i in range(2,n) ]
  # Get every prime that occurs in factorizations, and the max amount
  # of times it is repeated in a single factorization
  prime_max_occurence = {}
  for factorization in factorizations:
    merge(prime_max_occurence, factorization)
  return prime_max_occurence 

def smallest_multiple(n):
  prime_max_occurence = lcm_factorization(n+1)
  smallest_mult = 1
  for k, v in prime_max_occurence.iteritems():
    smallest_mult *= k**v
  return smallest_mult

if __name__=="__main__":
  print smallest_multiple(int(sys.argv[1]))
