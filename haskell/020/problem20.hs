import Data.Char (digitToInt)

sumDigits :: Integer -> Int
sumDigits n = sum . map digitToInt . show $ n

main = print $ sumDigits $ product [1..100]
