{-
raiz2Grau :: (Ord a, Floating a) => a -> a -> a -> (a, a)
raiz2Grau a b c = if (delta >= 0)
                             then ((-b + delta)/divisor, (-b - delta)/divisor)
                             else (0, 0)
    where
        divisor = 2*a
        delta = sqrt(b*b-4*a*c)
-}

mediaPonderada :: (Eq a, Floating a) => a -> a -> (a -> a -> a)
mediaPonderada w1 w2
    | w1 + w2 /= 1 = error "Pesos inválidos"
    | otherwise = \x y -> x*w1+y*w2

converteNota :: (Ord a, Floating a) => a -> Char
converteNota nota
    | nota >= 8 = 'A'
    | nota >= 7 = 'B'
    | nota >= 6 = 'C'
    | nota >= 5 = 'D'
    | otherwise  = 'F'

conceitoFinal :: Char -> Char -> Char
conceitoFinal 'F' _    = 'F'
conceitoFinal  _ 'F'   = 'F'
conceitoFinal 'D' 'C' = 'D'
conceitoFinal 'D' _   = 'C'

conceitoFinal 'C' '_' = 'C'
conceitoFinal 'C' 'B' = 'C'
conceitoFinal 'C' 'A' = 'B'


raiz2Grau :: (Ord a, Floating a) => a -> a -> a -> (a, a)
raiz2Grau a b c
    | delta >= 0 = ((-b + delta)/divisor, (-b - delta)/divisor)
    | otherwise   = error "Delta negativo"
    where
        divisor = 2*a
        delta = sqrt(b*b-4*a*c)
{-
(&&) :: Bool -> Bool -> Bool
True && True = True
_       && _      = False
-}






turmaA1Pratica = mediaPonderada 0.4 0.6
turmaA1Teoria  = mediaPonderada 0.3 0.7

p1A1P = 3
p2A1P = 8
p1A1T = 7
p2A1T = 10

mediaP = turmaA1Pratica p1A1P p2A1P
mediaT = turmaA1Teoria p1A1T p2A1T

finalA1 = conceitoFinal
    (converteNota mediaP) (converteNota mediaT)

turmaA2Pratica = mediaPonderada 0.4 0.6
turmaA2Teoria  = mediaPonderada 0.3 0.9

p1A2P = 3
p2A2P = 8
p1A2T = 7
p2A2T = 10

mediaA2P = turmaA2Pratica p1A2P p2A2P
mediaA2T = turmaA2Teoria p1A2T p2A2T

finalA2 = conceitoFinal
    (converteNota mediaA2P) (converteNota mediaA2T)