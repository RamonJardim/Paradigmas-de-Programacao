module Lib where

import Data.List

votos :: [String]
votos = ["Vermelho", "Azul", "Verde", "Azul", "Azul", "Vermelho"]
votosRanks :: [[String]]
votosRanks = [["Vermelho", "Verde"],
              ["Azul"],
              ["Verde", "Vermelho", "Azul"],
              ["Azul", "Verde", "Vermelho"],
              ["Verde"]]

someFunc :: IO ()
someFunc = do
    print $ vencedor votos
    print $ vencedor' votosRanks
    
conta :: Eq a => a -> [a] -> Int
conta _ [] = 0
conta x vs | x == head vs = 1 + (conta x $ tail vs)
           | otherwise = (conta x $ tail vs)
           
unicos :: Eq a => [a] -> [a]
unicos (v:vs) | inList v vs = unicos vs
              | otherwise   = v:unicos vs
              
        where
        inList :: a -> [a] -> Bool
        inList _ []     = False
        inList y (x:xs) = y==x || inList y xs

resultado :: Ord a => [a] -> [(Int, a)]
resultado []     = []
resultado (v:vs) = (conta v (v:vs),v):(resultado vs)


--vencedor :: Ord a => [a] -> a
