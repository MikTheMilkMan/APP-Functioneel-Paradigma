import Data.List.Split ( split, startsWithOneOf, condense, oneOf )
import Data.Integer.Conversion ( stringToInteger )

main :: IO ()
main = do
      putStrLn "This is a demonstration of the text compression algorithm:"
      putStrLn " "

      print ("=== COMPRESSION ===")
      print (compressionOneLine testString1 1 1)
      print (decompressionOneLine (compressionOneLine testString1 1 1))
      print ((decompressionOneLine (compressionOneLine testString1 1 1)) == testString1)
      
      putStrLn " "
      print ("=== DECOMPRESSION ===")
      print (compressionOneLine testString2 1 1) 
      print (decompressionOneLine (compressionOneLine testString2 1 1))
      print ((decompressionOneLine (compressionOneLine testString2 1 1)) == testString2)

      putStrLn " "

      print ("=== COMPRESSION - MULTIPLE LINES ===")
      print (compressionMultipleLines testStrings1 0)

      putStrLn " "
      print ("=== DECOMPRESSION - MULTIPLE LINES ===")
      print (decompressionMultipleLines testStrings2 0)

      putStrLn "\n"
      putStrLn "Please type a String you would like to compress:"
      userInput <- getLine
      putStrLn "Thank you for your input. This is the result:"
      print(userInput)
      print(compressionOneLine userInput 1 1)
      print(decompressionOneLine (compressionOneLine userInput 1 1))
      

-- VARIABELEN OM MEE TE TESTEN

testString1::String
testString1 = "AAAAABBBBBCCCDDDDEEEEEEFGHIJjjJ"

testString2::String
testString2 = "AAAAAAAAAABBBBBCCCDDDDEEEEEEFGHIJjjJ"

testStrings1::[String]
testStrings1 = ["test", "aaaa", "guhhhhh"]

testStrings2::[String]
testStrings2 = ["t1e1s1t1", "a4", "g1u1h5"]



-- CODE

compressionOneLine :: String -> Int -> Int -> String
compressionOneLine input index count 
  | index == length input - 1 =
    if input!!index /= input!!(index - 1) then
      [input!!(index - 1)] ++ show count ++ [input!!index, '1']
    else
      [input!!index] ++ show (count + 1)


  | otherwise =
    if input!!index /= input!!(index - 1) then
      [input!!(index - 1)] ++ show count ++ compressionOneLine input (index + 1) 1
    else
      compressionOneLine input (index + 1) (count + 1)

compressionMultipleLines :: [String] -> Int -> [String]
compressionMultipleLines input index
  | index == length input - 1 =
    [compressionOneLine (input!!index) 1 1]
  | otherwise = 
    [compressionOneLine (input!!index) 1 1] ++ compressionMultipleLines input (index+1)


decompressionMultipleLines :: [String] -> Int -> [String]
decompressionMultipleLines input index
  | index == length input - 1 =
    [decompressionOneLine (input!!index)]
  | otherwise =
    [decompressionOneLine (input!!index)] ++ decompressionMultipleLines input (index+1)

decompressionOneLine :: String -> String
decompressionOneLine input =
  decode (split (startsWithOneOf ['A'..]) input) 0


decode :: [String] -> Int -> String
decode input index 
  | index == length input - 1 = 
    characterGiver 
      ((charAndAmountSplitter (input!!index))!!0!!0) 
      (stringToInteger ((charAndAmountSplitter (input!!index))!!1)) 
  | otherwise = 
    characterGiver 
      ((charAndAmountSplitter (input!!index))!!0!!0) 
      (stringToInteger ((charAndAmountSplitter (input!!index))!!1))
    ++ decode input (index+1)


characterGiver :: Char -> Integer -> String
characterGiver char count 
  | count > 1 =
    char : characterGiver char (count - 1)
  | otherwise =
    [char]


charAndAmountSplitter :: String -> [String]
charAndAmountSplitter input = 
    split(condense(oneOf['0'..'9'])) input



-- TESTS --

test :: Integer -> Integer
test t
  | t == 0
  = 20
  | t > 0
  = t * 20

add :: Integer -> Integer -> Integer
add x y = x + y

guh :: String -> Char
guh input = input!!1

