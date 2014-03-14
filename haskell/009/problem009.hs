(x, y) = (filter (\(x,y) -> x^2 + y^2 == (1000-x-y)^2) [(x,y) | x <- [1..1000], y <- [1..x]]) !! 0

main = do
    print $ x * y * (1000-x-y)
