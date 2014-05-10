import Data.Char (digitToInt)

sumDigits :: Integer -> Int
sumDigits n = foldr (sumCharInt) 0 . show $ n
    where sumCharInt x z = digitToInt x + z

main = print . sumDigits $ 2^1000
