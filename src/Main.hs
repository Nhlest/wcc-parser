module Main where

import Parser ( tokenizeHCC, parseHCCTokens )
import Translator ( translateToAsm )

main = do
  res <- tokenizeHCC "fib.hc"
  either
    ( fail . show )
    ( either
      ( fail . show )
      ( putStrLn . concat . map show . translateToAsm ) . parseHCCTokens
    ) res