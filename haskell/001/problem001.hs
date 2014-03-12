sumOfMultiples :: Int -> Int
sumOfMultiples x = sum $ filter multipleOfThreeOrFive [1..x-1]
    where multipleOfThreeOrFive = \x -> x `mod` 3 == 0 || x `mod` 5 == 0

main = do
    print $ sumOfMultiples 1000
