splitInChuncks :: Int -> String -> [String]
splitInChuncks n [] = []
splitInChuncks n xs = [first_part] ++ (splitInChuncks n second_part)
    where (first_part, second_part) = splitAt n xs


input :: String -> [Integer]
input = map read . splitInChuncks 50 . concat . lines

main = print . take 10 . show . sum . input =<< readFile "input.txt"
