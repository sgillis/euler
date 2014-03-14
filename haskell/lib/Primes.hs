module Primes where

-- Prime factorization
primeFactors' :: Int -> Int -> [Int]
primeFactors' 1 _ = []
primeFactors' n f
    | n `mod` f == 0 = f : primeFactors' (n `div` f) f
    | otherwise      = primeFactors' n (f+1)

primeFactors :: Int -> [Int]
primeFactors n = primeFactors' n 2

-- Find lcm
data PrimeMult = PrimeMult { prime :: Int
                           , mult :: Int } deriving (Show)

instance Eq PrimeMult where
    (PrimeMult p1 _) == (PrimeMult p2 _) = p1 == p2

addToMultList :: [PrimeMult] -> Int -> [PrimeMult]
addToMultList [] n = [PrimeMult {prime=n, mult=1}]
addToMultList ((PrimeMult p m):xs) n
    | n == p    = PrimeMult {prime=p, mult=(m+1)} : xs
    | otherwise = PrimeMult {prime=p, mult=m} : addToMultList xs n

decompose :: Int -> [PrimeMult]
decompose n = foldl addToMultList [] (primeFactors n)

updateToMaxMult :: PrimeMult -> [PrimeMult] -> [PrimeMult]
updateToMaxMult pm [] = [pm]
updateToMaxMult pm1@(PrimeMult p1 m1) (pm2@(PrimeMult p2 m2):ys)
    | p1 == p2  = PrimeMult {prime=p1, mult=(max m1 m2)} : ys
    | otherwise = pm2 : updateToMaxMult pm1 ys

smallestMultipleDecomp :: [PrimeMult] -> [PrimeMult] -> [PrimeMult]
smallestMultipleDecomp [] ys = ys
smallestMultipleDecomp (x:xs) (ys) = smallestMultipleDecomp xs (updateToMaxMult x ys)

getNumber :: [PrimeMult] -> Int
getNumber [] = 1
getNumber ((PrimeMult p m):xs) = (p^m)*(getNumber xs)

smallestMultiple :: [Int] -> Int
smallestMultiple xs = getNumber $ foldl smallestMultipleDecomp (decompose 1) (map decompose xs)

-- Prime generation
primes :: [Int]
primes = sieve [2..]
    where
        sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]
