{-# LANGUAGE ViewPatterns, ScopedTypeVariables #-}

module Lib
  ( utcTimeFromUnix
  , readIntegerEither
  ) where

import Data.Time
import Text.Read (readMaybe)

epoch :: UTCTime
epoch = UTCTime (fromGregorian 1970 0 0) 0

-- | Convert an integral Unix timestamp (seconds from the epoch) to a 'UTCTime'
utcTimeFromUnix :: Integral a => a -> UTCTime
utcTimeFromUnix = flip addUTCTime epoch . fromIntegral

-- | Like 'readEither' except specialised to 'Integer' and with user-friendly
-- error messages on parse failure ('Left' result).
readIntegerEither :: String -> Either String Integer
readIntegerEither (readMaybe -> Just t) = Right t
readIntegerEither s@(readMaybe -> Nothing :: Maybe Integer) =
  Left $ "Can't parse \""++s++"\" as Integer"
