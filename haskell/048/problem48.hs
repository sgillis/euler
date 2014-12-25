bigNumber = show $ sum [a^a | a <- [1..1000]]

main :: IO ()
main = print $ drop (length bigNumber - 10) bigNumber
