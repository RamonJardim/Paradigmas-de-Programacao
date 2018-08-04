--http://logicgridpuzzles.com/puzzles/show_logic.php?ID=17

import Data.List

nomes :: [String]
nomes = ["Evan", "Maria", "Steve"]

sobreNomes :: [String]
sobreNomes = ["Earl", "Sacks", "Wilson"]

instrumentos :: [String]
instrumentos = ["Alto Sax", "Piano", "Tenor Sax"]

ordem :: [Int]
ordem = [1,2,3]

nomesPerms = permutations nomes
sobreNomesPerms = permutations sobreNomes
instrumentosPerms = permutations instrumentos
ordemPerms = permutations ordem

combinacoes = [zip3 b c d | b <-sobreNomesPerms, 
                            c <-instrumentosPerms, d<-ordemPerms]


evan [a1, _, _] = a1
maria [_, a2, _] = a2
steve [_, _, a3] = a3


sobreNome (b,_,_) = b
instrumento(_,c,_) = c
getOrdem(_,_,d)     = d

-- operador Se booleano
True ==> True  = True
True ==> False = False
_    ==> _     = True

regra1 as = (getOrdem (evan as)) == 1       -- O instrumento do líder foi o primeiro, Evan é o lider.
regra2 as = (instrumento (maria as)) == "Piano" -- Maria cantou e tocou.
regra3 as = (getOrdem (maria as)) < (getOrdem (steve as)) -- Maria tocou antes do steve
regra4 as = sobreNome (steve as) == "Sacks" -- Sobrenome do Steve é Sacks 
regra5 as = instrumento (steve as) /= "Piano"  -- Steve tocou algum sax
regra6 a   = (sobreNome a == "Wilson") ==>
         (instrumento a == "Alto Sax") -- A pessoa com sobrenome Wilson tocou
                                                                                                -- antes da pessoa que toca Tenor Sax



condicional r as = all r as 
posicional  r as = r as

soluções = [c | c <- combinacoes,
                posicional regra1 c,
                posicional regra2 c,
                posicional  regra3 c,
                posicional  regra4 c,
                posicional  regra5 c,
                condicional regra6 c
           ]
main = do
    print("Evan "++(sobreNome(evan (head soluções)))++
        ", Instrumento: "++(instrumento(evan (head soluções)))++
        ", "++(show (getOrdem(evan (head soluções))))++"o Solo.")

    print("Maria "++(sobreNome(maria (head soluções)))++
        ", Instrumento: "++(instrumento(maria (head soluções)))++
        ", "++(show (getOrdem(maria (head soluções))))++"o Solo.")

    print("Steve "++(sobreNome(steve (head soluções)))++
        ", Instrumento: "++(instrumento(steve (head soluções)))++
        ", "++(show (getOrdem(steve (head soluções))))++"o Solo.")

