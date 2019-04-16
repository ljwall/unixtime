module Main where

import Lib

import Data.Either (either)
import Data.Time
import System.IO (getContents)
import System.Exit (die)

getLines :: IO [String]
getLines = fmap lines getContents

act :: Either String UTCTime -> IO ()
act = either die print

main :: IO ()
main = do
  ls <- getLines
  mapM_ (act . utcTimeFromStringEither) ls
