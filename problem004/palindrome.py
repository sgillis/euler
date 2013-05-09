import sys

def is_palindrome(n):
  '''
  Takes an integer n and determines if it is a palindrome
  '''
  string = str(n)
  return all(string[i]==string[-(i+1)] for i in range(len(string)/2))

def largest_palindrome(n):
  '''
  Finds the largest palindrome made from the product of two n-digit numbers
  '''
  result = [0,0,0]
  start_integer, end_integer = 10**(n-1), 10**n
  for i in range(start_integer, end_integer):
    for j in range(start_integer, end_integer):
      if is_palindrome(i*j) and i*j>result[0]:
        result = [i*j, i, j]
  return result

if __name__=="__main__":
  print largest_palindrome(int(sys.argv[1]))
