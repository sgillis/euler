import Control.Arrow ((***))
import Data.Ord (comparing)
import Data.List (foldl1')

collatz :: Integer -> [Integer]
collatz 1 = [1]
collatz n = n : collatz n'
    where n'
           | even n    = n `div` 2
           | otherwise = 3*n + 1

-- Define a strict maximumBy. Nonstrict maximumBy results in space leaks
-- http://web.archiveorange.com/archive/v/NrglUM6DmUhAPuFjRd3S
maximumBy :: (a -> a -> Ordering) -> [a] -> a
maximumBy _ [] =  error "List.maximumBy: empty list"
maximumBy cmp xs = foldl1' maxBy xs
    where maxBy x y = case cmp x y of
            GT -> x
            _  -> y

main = print . maximumBy (comparing fst) .
       map ((length *** head) . \xs -> (xs, xs)) .
       map collatz $ [1..1000000]
