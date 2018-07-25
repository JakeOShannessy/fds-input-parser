module Text.FDSInputParser
    ( parseFDSInputFile
    , parseFDSInput
    ) where

import Text.Namelist (namelistParser, NamelistFile)
import Text.FDSInputParser.Spec (fdsSpec)
import Text.Parsec
import qualified Data.Text as T
import qualified Data.Text.IO as T

parseFDSInputFile :: FilePath -> IO (Either ParseError NamelistFile)
parseFDSInputFile filepath = do
    rawText <- T.readFile filepath
    pure $ parse (namelistParser fdsSpec) filepath rawText

parseFDSInput :: T.Text -> Either ParseError NamelistFile
parseFDSInput input = parse (namelistParser fdsSpec) "(unknown)" input