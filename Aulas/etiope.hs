etiope :: Int -> Int -> Int
etiope m n
        |m == 1         = n
        |m `mod` 2 == 0 = etiope (quot m 2) (n*2)
        |otherwise      = (etiope (quot m 2) (n*2)) + n
        
        
etiopeCaudal :: Int -> Int -> Int
etiopeCaudal 0 _ = 0
etiopeCaudal _ 0 = 0
etiopeCaudal m n = etiopeC m n 0
    where etiopeC m n s
            |m == 1         = n + s
            |m `mod` 2 == 0 = etiopeC (quot m 2) (n*2) s
            |otherwise      = etiopeC (quot m 2) (n*2) (n+s) 
            
            
sum1 :: Num a => [a] -> a
sum1 [] = 0
sum1 (n:ns) = sum' ns n
    where
        sum' [] s = s
        sum' (b:bs) s = sum' bs (s+b)
        
insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) 
        | x <= y = x:y:ys
        | otherwise = y:insert x ys
        
isort :: Ord a => [a] -> [a]
isort []     = []
isort [x]    = [x]
isort (x:xs) = insert x (isort xs)