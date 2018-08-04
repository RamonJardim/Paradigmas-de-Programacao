import Test.QuickCheck
import Data.List

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] xs = xs
merge xs [] = xs
merge (x:xs) (y:ys)  | x <= y     = (x:merge xs (y:ys))
                                 | otherwise = (y:merge (x:xs) ys)


metade :: [a] -> ([a],[a])
metade []   = ([],[])
metade [x] = ([x], [])
metade xs  = (a, b)
                     where
                        a = take (quot tam 2) xs
                        b = drop (quot tam 2) xs
                        tam = length xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = (merge (msort half1) (msort half2))
                  where
                    half1 = fst (metade xs)
                    half2 = snd (metade xs)


------------------
prop_idempotencia :: Ord a => [a] -> Bool
prop_idempotencia xs = msort (msort xs) == msort xs

prop_length :: Ord a => [a] -> Bool
prop_length xs = length (msort xs) == length xs

prop_minimum :: Ord a => [a] -> Property
prop_minimum xs = not (null xs)
                                   ==> head (msort xs) == minimum xs

prop_model :: Ord a => [a] -> Bool
prop_model xs = msort xs == sort xs