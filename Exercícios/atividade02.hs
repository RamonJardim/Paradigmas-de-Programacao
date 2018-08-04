bools :: [Bool]
bools = [True, False]

nums :: [[Int]]
nums = [[1, 2], [3, 4]]

soma :: Int -> Int -> Int -> Int
soma a b c = a+b+c

copia :: a -> (a, a)
copia w = (w, w)

f :: a -> a
f x = x

g :: Eq a => a -> (a, a) -> Bool
g k (i, j) = fst(i,j) == k

h :: Num a => Int -> a -> a
h y x = x