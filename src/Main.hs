module Main where

import Day
import System.Environment

main :: IO ()
main = do
  x:_<-getArgs
  putStrLn.day $
    read x::Int
