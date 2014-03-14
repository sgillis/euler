threeDigitNumbers = [x*100 + y*10 + z | x <- [1..9], y <- [0..9], z <- [0..9]]
products = [ x*y | x <- threeDigitNumbers, y <- threeDigitNumbers]
palindromes xs = filter (\x -> revNum x == x) xs
    where
        revNum = read . reverse . show

main = do
    print $ maximum $ palindromes products
