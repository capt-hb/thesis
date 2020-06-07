import System.Environment
import Data.List
import Data.Char
import Data.Maybe

main = do
     args <- getArgs
     contents <- readFile (args !! 0)
     let instructions = map trimLeft (filter (not . isEmpty) (lines contents))
     putStrLn(unlines (filter containsInstruction instructions))

containsInstruction :: String -> Bool
containsInstruction str
  | isEmpty str || isComment str || isDirective str = False
  | otherwise = case elemIndex ':' str of
                      Nothing -> True
                      Just idx -> (isInstruction ((trimLeft . snd) (splitAt (idx + 1) str)))

isInstruction :: String -> Bool
isInstruction str = not (isEmpty str || isComment str || isDirective str)
        
isDirective :: String -> Bool
isDirective = isPrefixOf "." 

isComment :: String -> Bool
isComment = isPrefixOf "#"

trimLeft :: String -> String
trimLeft = dropWhile isSpace

isEmpty :: String -> Bool
isEmpty = all isSpace
