import Data.List (group, subsequences, nub)
import Data.Maybe (catMaybes)

import Primes (primeFactors)

properDivisors :: Int -> [Int]
properDivisors n = filter (<n)      -- remove n itself
                 . nub              -- take only unique elements
                 . map product      -- multiply all subsequences
                 . subsequences     -- generate all possible combinations
                 $ primeFactors n   -- get all primefactors of n

sumProperDivisors :: Int -> Int
sumProperDivisors n = sum $ properDivisors n

amicablePartner :: Int -> Maybe Int
amicablePartner n
    | sumProperDivisors x == n && x /= n = Just x
    | otherwise                          = Nothing
        where x = sumProperDivisors n

amicableNumbers :: [Int] -> [Int]
amicableNumbers xs = catMaybes . map amicablePartner $ xs

main = print . sum . amicableNumbers $ [2..10000]
