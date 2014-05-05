import Data.List
import Control.Arrow
import Primes (primeFactors)

triangleNumbers :: [Int]
triangleNumbers = scanl1 (+) [1..]

nDivisors :: Int -> Int
nDivisors n = product . map ((+1) . length) $ group $ primeFactors n

main = print . head . filter ((>500) . fst) . map ((nDivisors *** id) . (\n -> (n,n))) $ triangleNumbers
