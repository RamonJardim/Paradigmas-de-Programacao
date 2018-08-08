import Control.Monad
import Control.Applicative
import Data.List

type Pos = (Int, Int)

largura :: Int
largura = 10

altura :: Int
altura = 10

type Board = [Pos]

glider :: Board
glider = [(4,2),(2,3),(4,3),(3,4),(4,4)]

-- | limpa a tela
cls :: IO ()
cls = putStr "\ESC[2J"

-- | coloca o cursor na posição x,y
goto :: Pos -> IO ()
goto (x, y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

writeAt :: Pos -> String -> IO ()
writeAt p xs = do goto p
                  putStr xs

showCells :: Board -> IO [()]
showCells b = sequenceA [writeAt p "O" | p <- b]

isAlive :: Board -> Pos -> Bool
isAlive b p = elem p b

isEmpty :: Board -> Pos -> Bool
isEmpty b p = not(isAlive b p)

neighbs :: Pos -> [Pos]
neighbs (x,y) = map wrap [(x+i, y+j) | i <- [-1..1],
                                j <- [-1..1], i /= 0 || j /= 0]
        where
            wrap :: Pos -> Pos
            wrap (x, y) = ( ((x-1) `mod` largura) + 1,
                 ((y-1) `mod` altura) + 1)

liveNeighbs :: Board -> Pos -> Int
liveNeighbs b p = length (filter alives ngbs)
            where
                ngbs   = neighbs p
                alives = isAlive b


regra1 :: Board -> Pos -> Bool
regra1 b p = n==2 || n==3
        where
            n = liveNeighbs b p

survivors :: Board -> [Pos]
survivors b = [ p | p <- b, regra1 b p]

births :: Board -> [Pos]
births b = [p | p <- nub $ concat $ map neighbs b,
                ,isEmpty b p, (liveNeighbs b p) == 3]


nextGen :: Board -> Board
nextGen b = survivors b ++ births b

life :: Board -> IO ()
life b = do cls
            showCells b
            wait 100000 -- ajuste para seu PC
            life (nextGen b)

wait :: Int -> IO [()]
wait n = sequenceA [return () | _ <- [1..n]]

main :: IO ()
main = life glider