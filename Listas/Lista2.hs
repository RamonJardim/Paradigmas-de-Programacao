penultimo :: [a] -> a
penultimo [x] = head []
penultimo xs  = head (drop ((length xs)-2) xs)

--maximoLocal :: [Int] -> [Int]
--maximoLocal ns = ml ns []
 --   where
 --       ml ns xs = 

produtoEscalar :: Num a => [a] -> [a] -> a
produtoEscalar xs ys = sum [(fst t) * (snd t) | t <- zip xs ys]


co :: (b -> c) -> (a -> b) -> a -> c
co f g = \x -> f (g x)

co1 :: (b -> c) -> (a -> b) -> a -> c
co1 f g x = f (g x)

palindromo :: [Int] -> Bool
palindromo [] = True
palindromo ns = if a == b 
                then palindromo cs
                else False
                
        where
            a = head ns
            b = head (reverse ns)
            cs = tail (reverse (tail ns))
            
ordenaListas :: (Num a, Ord a) => [[a]] -> [[a]]
ordenaListas [] = []
ordenaListas (n:ns) = (ordenaListas menores) ++ (n:(ordenaListas maiores))
        where
            menores = [ x | x <- ns, length x <= length n]
            maiores = [ y | y <- ns, length y > length n]