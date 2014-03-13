module Primes where

primeFactors' :: Int -> Int -> [Int]
primeFactors' 1 _ = []
primeFactors' n f
    | n `mod` f == 0 = f : primeFactors' (n `div` f) f
    | otherwise      = primeFactors' n (f+1)

primeFactors :: Int -> [Int]
primeFactors n = primeFactors' n 2
