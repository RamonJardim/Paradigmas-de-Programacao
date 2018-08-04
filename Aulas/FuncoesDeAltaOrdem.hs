-- $ separa as aplicações de função sem necessidade de parentese

somaQuadPares :: [Int] -> Int
somaQuadPares ns = sum [n^2 | n <- ns, even n]

reverse1 :: [a] -> [a]
reverse1 []     = []
reverse1 (xs) = foldr (:) [] $ (drop 1 xs) ++ (take 1 xs) -- errado

snoc :: a -> [a] -> [a]
snoc x xs = xs ++ [x]

reverse2 :: [a] -> [a]
reverse2 = foldr snoc []

-- foldl (&&) False [False, False, False, False]
-- (((([]:False):False):False):False)
-- ((((False && False) && False) && False) && False)
-- ((((False) && False) && False) && False)
-- (((False) && False) && False)
-- ((False) && False)
-- False

-- foldr (&&) False [False, False, False, False]
-- False:(False:(False:(False:([]))))
-- False && (False && (False && (False && (False))))
-- False

-- Se a lista for infinita, usar foldr, porque o foldl inverte
-- Possibilidade de curto circuito, usar foldr

-- Lista finita e não há curto circuito, usar foldl
-- Se fizer sentido inverter a lista, usar foldl

-- No Data.Lista existe o foldl', que não faz avaliação preguiçosa