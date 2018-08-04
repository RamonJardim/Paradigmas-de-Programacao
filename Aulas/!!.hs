import Debug.Trace

f :: Int -> [a] -> a
f 0 (x:xs) = x
f n (x:xs) = f (n-1) xs

--g :: Int -> [a] -> [a]
--g n xs = 

fact :: Int -> Int
fact n = product [1..n]

l :: [b] -> Int
l xs = sum [ 1 | _ <- xs]

divisores :: Integral a => a -> [a]
divisores n = [ x | x <- [1 .. n], n `mod` x == 0]

fib :: Integer -> Integer
fib 1 = 1
fib 2 = 1
fib n = fib (n-2) + fib(n-1)

primo :: Int -> Bool
primo n = (length (divisores n)) == 2;

sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x,y) <- pairs xs]

{-primo2 :: Int -> Int -> Bool
primo2 n i
        | n % i /= 0 = False
        | -}

pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

perfeitos :: Integral a => a -> [a]
perfeitos n = [x | x <- [1..n], perfeito x]

perfeito :: Integral a => a -> Bool
perfeito n = sum (divisores n) - n == n

collatz :: {-Integral a =>-} Integer -> Bool
collatz n
            | n == 1    = True 
            | even n    = trace ("n: " ++ (show n)) $ collatz (quot n 2) 
            | otherwise = trace ("n: " ++ (show n)) $ collatz (3*n+1)
          
collatzCount :: Integral a => a -> a -> a
collatzCount n i = if even n
                    then collatzCount (quot n 2) (i+1)
                    else if odd n && n /= 1
                            then collatzCount (3*n+1) (i+1)
                         else i

--main = putStrLn $ "Collatz 4: " ++ show (collatz 6646546546564646544654565465465465426872612686749265458976265566584651456789/*)