import Control.Arrow
import Data.Array

input :: String -> Array (Integer, Integer) Int
input = listArray ((1,1),(20,20)) . map read . concat . map words . lines

directions :: [(Integer, Integer) -> (Integer, Integer)]
directions = [(+1) *** id, (+1) *** (+1), id *** (+1), (+1) *** (\n -> n - 1)]

inArray :: Ix a => Array a e -> a -> Bool
inArray a i = inRange (bounds a) i

prods :: Num e => Array (Integer, Integer) e -> [e]
prods a = [product xs | i <- range $ bounds a,
                        s <- directions,
                        let is = take 4 $ iterate s i,
                        all (inArray a) is,
                        let xs = map (a!) is]

main = print . maximum . prods . input =<< readFile "input.txt"
