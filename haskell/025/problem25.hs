{-# LANGUAGE BangPatterns #-}

-- Define memoization tree
data Tree a = Tree (Tree a) a (Tree a)

instance Functor Tree where
    fmap f (Tree l m r) = Tree (fmap f l) (f m) (fmap f r)

-- Index the tree
index :: Tree a -> Integer -> a
index (Tree _ m _) 0 = m
index (Tree l _ r) n = case (n - 1) `divMod` 2 of
                            (q,0) -> index l q
                            (q,1) -> index r q

-- Put all natural numbers in the tree
nats :: Tree Integer
nats = go 0 1
    where
        go !n !s = Tree (go l s') n (go r s')
            where
                l = n + s
                r = l + s
                s' = s * 2

toList :: Tree a -> [a]
toList as = map (index as) [0..]

-- Define Fibonacci array, but make it open recursion to be able to memoize
f :: (Integer -> Integer) -> Integer -> Integer
f mf 0 = 1
f mf 1 = 1
f mf n = mf (n-1) + mf (n-2)

-- Put the Fibonacci array in a tree for easy indexing
fibTree :: Tree Integer
fibTree = fmap (f fastFib) nats

-- Use this to calculate the nth Fibonacci number by indexing the Fibonacci
-- tree
fastFib :: Integer -> Integer
fastFib = index fibTree

numberOfDigits :: Integer -> Int
numberOfDigits = length . takeWhile (>0) . iterate (`div` 10)

countFibDigits :: Tree Int
countFibDigits = fmap numberOfDigits fibTree

-- Some alternatives for efficient Fibonacci
fib = 1 : 1 : fibo fib
    where
        fibo (x:y:rest) = x + y : fibo (y:rest)

fib' = 1 : 1 : zipWith (+) fib' (tail fib')


main :: IO ()
main = print $ (+1) . length . takeWhile (<1000) . toList $ countFibDigits
