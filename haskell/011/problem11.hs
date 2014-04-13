import Control.Monad (liftM)

main = do
    contents <- liftM parseInput $ readFile "input.txt"
    return contents

parseInput :: String -> [[Int]]
parseInput = map (\list -> map read list :: [Int]) . map words . lines
