module Main where

import Lib

import Data.Either (either)
import System.IO (getContents)
import System.Exit (die)

-- | Read stdin split as lines
getLines :: IO [String]
getLines = fmap lines getContents

-- | Act on a single line of input: Atempt to parse it as an 'Integer', convert
-- to a 'UTCDate', and either die with an error message, or print the resulting
-- date to stdout.
act :: String -> IO ()
act = either die print . (utcTimeFromUnix <$>) . readIntegerEither

-- | Read lines from stdin and act on each line
main :: IO ()
main = getLines >>= mapM_ act
