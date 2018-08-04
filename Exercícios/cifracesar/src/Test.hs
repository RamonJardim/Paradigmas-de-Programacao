module Test where

import Cesar

prop_neg_shift :: Int -> Char -> Bool
prop_neg_shift n c = c == (shift n (shift (-n) c))

prop_enc_length :: Int -> String -> Bool
prop_enc_length n cs = (length cs) == (length (encode n cs))