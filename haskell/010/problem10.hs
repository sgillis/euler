import Primes (findPrimes)

main = do
    print $ sum $ findPrimes 2000000
