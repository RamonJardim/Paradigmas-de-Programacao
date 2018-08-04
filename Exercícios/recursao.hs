and1 :: [Bool] -> Bool
and1 [] = True
and1 (False:xs) = False
and1 (True:xs) = and1 xs

concat1 :: [[a]] -> [a]
concat1 [[]] = []
concat1 (xs:xss) = xs++concat1 xss

replicate1 :: Int -> a -> [a]
replicate1 0 _ = []
replicate1 n x = x:(replicate1 (n-1) x)

(!) :: [a] -> Int -> a
(!) (x:xs) 0 = x
(!) (x:xs) n = xs ! (n-1) 

elem1 :: Eq a => a -> [a] -> Bool
elem1 _ [] = False
elem1 a (x:xs)  | x == a = True
                          | otherwise = elem1 a xs


merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] xs = xs
merge xs [] = xs
merge (x:xs) (y:ys)  | x <= y     = (x:merge xs (y:ys))
                                 | otherwise = (y:merge (x:xs) ys)


metade :: [a] -> ([a],[a])
metade []  = ([],[])
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
{- prop_idempotencia :: Ord a => [a] -> Bool
prop_idempotencia xs = msort (msort xs) == msort xs

prop_length :: Ord a => [a] -> Bool
prop_length xs = length (msort xs) == length xs

{- prop_minimum :: Ord a => [a] -> Property
prop_minimum xs = not (null xs)
                                   ==> head (msort xs) == minimum xs -}

prop_model :: Ord a => [a] -> Bool
prop_model xs = msort xs == sort xs -}