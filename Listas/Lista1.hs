palindromo :: (Eq a) => [a] -> Bool
palindromo xs = reverse xs == xs

mult :: Int -> Int -> Int -> Int
mult = \x y z -> x*y*z


{-(||) :: Bool -> Bool-> Bool
(||) True _      = True
(||) _ True      = True
(||) False False = False-}


(||+) :: Bool -> Bool-> Bool
(||+) False False = False
(||+) _ _         = True

co :: (b -> c) -> (a -> b) -> a -> c
co a b c = a (b c)

and1 :: Bool -> Bool -> Bool
and1 a b = if a then b else a

c :: a -> b -> a
c x y = x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))