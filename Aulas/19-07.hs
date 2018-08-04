type String = [Char]
type Coord  = (Int, Int)
type Trans  = Coord -> Coord

data Nat = Zero | Succ Nat
data Jogada = Pedra | Papel | Tesoura
    deriving(Show, Eq)

ganhaDe :: Jogada -> Jogada
ganhaDe Pedra   = Papel
ganhaDe Tesoura = Pedra
ganhaDe Papel   = Tesoura

perdeDe :: Jogada -> Jogada
perdeDe Pedra   = Tesoura
perdeDe Papel   = Pedra
perdeDe Tesoura = Papel

ganhadores :: [(Jogada, Jogada)] -> [Int]
ganhadores js = [ fst x | x <- ms, perdeDe (fst (snd x)) == snd (snd x)]
            where ms = zip [0.. (length js) - 1] js
    
    
    
paraCima :: Trans
paraCima (x,y) = (x,y+1)

data Fuzzy = Verdadeiro | Falso | Pertinencia Double
            deriving (Show)

fuzzifica :: Double -> Fuzzy
fuzzifica d | d <= 0    = Falso
            | d >= 1    = Verdadeiro
            | otherwise = Pertinencia d
            
            
add :: Nat -> Nat -> Nat
add n (Succ m) = Succ (add n m)

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

data Tree a = Leaf a | Node (Tree a) a (Tree a)