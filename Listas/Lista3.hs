mc91 :: Integral a => a -> a
mc91 n | n > 100 = n - 10
       | otherwise = mc91 $ mc91 $ n+11
       
elem' :: Eq a => a -> [a] -> Bool
elem' _ []                 = False
elem' n (x:xs) | n == x    = True
               | otherwise = elem' n xs
               
euclid :: Int -> Int -> Int
euclid x y | x == y    = x
           | x < y     = euclid x (y-x)
           | otherwise = euclid (x-y) y
           
concat' :: [[a]] -> [a]
concat' []       = []
concat' (xs:xss) = xs++concat' xss

intersperse' :: a -> [a] -> [a]
intersperse' _ []     = []
intersperse' _ [x]    = [x]
intersperse' a (c:cs) = c:a:(intersperse' a cs)

wordNumber :: Char -> Int -> [Char]
wordNumber c n = concat' (intersperse' cs numStr)
                where
                cs = c:[]
                numStr = (map (dig2Str) (num2Vet n))
                
                num2Vet :: Int -> [Int]
                num2Vet 0 = []
                num2Vet n  = (num2Vet (quot n 10))++[mod n 10]

                dig2Str :: Int -> [Char]
                dig2Str 0 = "zero"
                dig2Str 1 = "um"
                dig2Str 2 = "dois"
                dig2Str 3 = "tres"
                dig2Str 4 = "quatro"
                dig2Str 5 = "cinco"
                dig2Str 6 = "seis"
                dig2Str 7 = "sete"
                dig2Str 8 = "oito"
                dig2Str 9 = "nove"
                dig2Str n = ""
                
merge :: Ord a => [a] -> [a] -> [a]
merge [] []         = []
merge xs []         = xs
merge [] ys         = ys
merge (x:xs) (y:ys) | x <= y    = x:merge xs (y:ys)
                    | otherwise = y:merge (x:xs) ys
                    
msort :: Ord a => [a] -> [a]
msort []  = []
msort [x] = [x]
msort xs = merge (msort (fst half)) (msort(snd half))
    where
    half = halve xs

halve :: [a] -> ([a], [a])
halve xs = (take (quot (length xs) 2) xs, drop (quot (length xs) 2) xs)

skips :: [a] -> [[a]]
skips (x:xs) = (x:xs):[(catch 2 1 xs)]
    where
    catch :: Int -> Int -> [a] -> [a]
    catch _ _ [] = []
    catch n t xs = (head ns):(catch n t (tail ns))
        where
        ns = drop (n-1) xs