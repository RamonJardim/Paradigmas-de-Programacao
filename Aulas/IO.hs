getLine' :: IO String
getLine' = do x <- getChar
              if x == '\n' then
               return []
              else
                pure (x:) <*> getLine'
              
              {-
                do xs <- getLine'
                   return (x:xs)-}
                   
                   
--putStrLn' :: String -> IO ()
--putStrLn' xs = do sequenceA [putStr' xs, putChar '\n']
--                 return ()
                 
                 
parseFile :: String -> [[Double]]
parseFile file = map parseLine (lines file)
                 where
                    parseLine l = map toDouble (words l)
                    toDouble w = read w :: Double

readMyFile :: [FilePath] -> IO [[Double]]
readMyFile []     = error ""
readMyFile [name] = (pure parseFile) <*> (readFile name) -- Applicative

--readMyFile [name] = fmap parseFile (readFile name) -- Functor

