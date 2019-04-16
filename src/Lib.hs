{-# LANGUAGE ViewPatterns #-}

module Lib
  ( utcTimeFromUnix
  , utcTimeFromStringEither
  ) where

import Data.Time
import Text.Read (readMaybe)

epoch :: UTCTime
epoch = UTCTime (fromGregorian 1970 0 0) 0

-- | Convert an integral Unix timestamp (seconds from the epoch) to a 'UTCTime'
utcTimeFromUnix :: Integral a => a -> UTCTime
utcTimeFromUnix = flip addUTCTime epoch . fromIntegral

-- | Parse a string value as an Integer representing a Unix timestamp, and
-- convert to a 'Either' 'String' 'UTCTime`. A 'Left' value indicates a parse
-- error.
utcTimeFromStringEither :: String -> Either String UTCTime
utcTimeFromStringEither s = utcTimeFromUnix <$> tryRead s
  where tryRead (readMaybe' -> Just t) = Right t
        tryRead (readMaybe' -> Nothing) = Left $ "Can't parse \""++s++"\" as Integer"

        readMaybe' :: String -> Maybe Integer
        readMaybe' = readMaybe
