module Main where

import Data.List

votos :: [String]
votos = ["Vermelho", "Azul", "Verde", "Azul", "Azul", "Vermelho"]

votosRanks :: [[String]]
votosRanks = [["Vermelho", "Verde"],
              ["Azul"],
              ["Verde", "Vermelho", "Azul"],
              ["Azul", "Verde", "Vermelho"],
              ["Verde"]]

-- conta quantos votos o candidato x recebeu
conta :: Eq a => a -> [a] -> Int
conta k [] = 0
conta k (x:xs) | k == x    = 1+conta k xs
               | otherwise = conta k xs

-- retorna a lista de elementos unicos
unicos :: Eq a => [a] -> [a]
unicos [] = []
unicos (x:xs) | inList x xs = unicos xs
              | otherwise   = x:unicos xs
              where
                  inList :: Eq a => a -> [a] -> Bool
                  inList _ [] = False
                  inList y (x:xs) = y == x || inList y xs

-- retorna uma lista de pares ordenados (votos, candidato) com o total de votos obtido por cada candidato
-- use a função sort para ordenar do menos para o mais votado
resultado :: Ord a => [a] -> [(Int,a)]
resultado [] = []
resultado (v:vs) = sort ((conta v (v:vs),v):resultado (filter(/=v) (v:vs)))

-- retorna o vencedor da eleição
vencedor :: Ord a => [a] -> a
vencedor xs = snd (last $ resultado xs)



-------------------------

-- elimina as listas vazias de uma lista de listas
rmvazio :: Eq a => [[a]] -> [[a]]
rmvazio xss = filter (/=[]) xss

-- elimina um candidato da lista de votos
elimina :: Eq a => a -> [[a]] -> [[a]]
elimina e xss = [ [ x | x <- xs, x /= e ] | xs <- xss]

-- retorna uma lista dos candidatos existentes, do menos para o mais votado
rank :: Ord a => [[a]] -> [a]
rank [[]] = []
rank xss  = 


main :: IO ()
main = do
    print $ vencedor votos
    --print $ vencedor' votosRanks