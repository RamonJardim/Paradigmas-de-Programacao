data Pokemon a = ATK a | DEF a | AD a
                    deriving (Show, Eq)
                    
instance Functor Pokemon where
    fmap g (ATK a) = ATK(g a)
    fmap g (DEF a) = DEF(g a)
    fmap g (AD  a) = AD (g a)
    
instance Applicativa Pokemon where
    pure x      = AD x
    g <*> ATK x = ATK (g x)
    g <*> DEF x = DEF (g x)
    g <*> AD  x = AD  (g x)
    
    
instance Monad Pokemon where
    (>>=) :: Pokemon a -> (a -> Pokemon b) -> Pokemon b
    (>>=) (Atk a) f = f a
    (>>=) (Def a) f = f a
    (>>=) (AD  a) f = f a