import Data.Char

toDigits :: Int -> [Int]
toDigits = map digitToInt . show

validNumber :: Int -> Int -> Bool
validNumber power number =
    number == (sum . map (^ power) . toDigits $ number)

main :: IO ()
main = print $ sum $ filter (validNumber 5) [10..1000000]
