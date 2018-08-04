module Cesar where
import Data.List    
import Data.Char

-- converte uma letra minuscula para inteiro
let2int :: Char -> Int
let2int c = ord c - ord 'a'

-- converte um inteiro para letra minuscula
int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0,
             0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0,
             6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

-- retorna a n-ésima letra seguinte,
-- evite ultrapassar o limite com `mod` 26
shift :: Int -> Char -> Char
shift n c 
    | c == ' ' = ' '
    | abs n > 26                                                                    = c
    | (isUpper c) && newC <= ord 'Z' && newC >= ord 'A'= chr newC
    | (isLower c) && newC <= ord 'z' && newC >= ord 'a' = chr newC
    | (isUpper c) && newC > ord 'Z'                                     = chr (newC - 26)
    | (isLower c) && newC > ord 'z'                                     = chr (newC - 26)
    | (isLower c) && newC < ord 'a'                                     = chr (26+newC)
    | (isUpper c) && newC < ord 'A'                                     = chr (26+newC)
    | otherwise                                                                      = c

    where
        newC = ord c + n

-- aplica a função shift em cada letra da string
encode :: Int -> String -> String
encode n cs = map (shift n) cs


crack :: String -> String
crack xs = encode (-factor) xs
    where
        factor = head (positions (minimum chitab) chitab)
        chitab = [chisqr (rotate n table') table
                | n <- [0..25]]
        table' = freqs xs

-- quantidade de letras minúsculas em uma String
lowers :: String -> Int
lowers cs = length [ c | c <- cs, isLower c]

-- conta a ocorrência de um caracter em uma String
count :: Char -> String -> Int
count c cs = length [x | x <- cs, x == c]

-- dado um n e m, calcule 100*n/m
percent :: Int -> Int -> Float
percent n m = 100*(fromIntegral(n)/fromIntegral(m))

-- calcule a porcentagem de cada letra minuscula
-- do alfabeto em uma String
-- a porcentagem é a contagem de ocorrência pelo total
-- de letras minúsculas
freqs :: String -> [Float]
freqs cs = [fromIntegral(count x cs)/total | x <- ['a'..'z']]

    where
        total = fromIntegral(lowers cs)

-- Calcule a medida de Chi-Squared de duas
-- tabelas de frequência:
-- Soma (Observado - Esperado)^2 / Esperado
chisqr :: [Float] -> [Float] -> Float
chisqr as bs = sum [(a-b)^2/b | (a,b) <- zip as bs]

-- rotaciona uma tabela em n posições
rotate :: Int -> [a] -> [a]
rotate n ns = (drop n ns)++(take n ns)

-- retorna a lista de posições que contém um
-- elemento x
positions :: Eq a => a -> [a] -> [Int]
positions a as = elemIndices a as