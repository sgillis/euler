'''
Calculate sum of all multiples of 3 and 5 below n

Usage:
  multiples.py <n>
'''

import schema
import docopt

def list_of_multiples(list_of_bases,n):
  '''
  Returns list of multiples of a lower than n
  '''
  return [ i for i in range(n) if any([i%a==0 for a in list_of_bases]) ]

def multiples_sum(n):
  '''
  Returns the sum of all multiples of 3 and 5 below n
  ''' 
  return sum(list_of_multiples([3,5],n))

if __name__=="__main__":
  args = docopt.docopt(__doc__)
  s = schema.Schema({ '<n>': schema.Use(int),
                      })
  args = s.validate(args)
  print multiples_sum(args['<n>'])
