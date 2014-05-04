import Control.Arrow
import Data.Array

input :: String -> Array (Int, Int) Int
input = listArray ((1,1),(20,20)) . map read . concat . map words . lines

main = print . input =<< readFile "input.txt"
