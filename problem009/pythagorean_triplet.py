def special_pythagorean_triplet():
  for i in range(1,1000):
    for j in range(i+1,1000):
      k = 1000 - i - j
      if (i**2 + j**2) == k**2:
        return (i,j,k)

if __name__=="__main__":
  triplet = special_pythagorean_triplet()
  print(triplet[0]*triplet[1]*triplet[2])
