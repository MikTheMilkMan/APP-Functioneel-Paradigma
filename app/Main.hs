{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use guards" #-}

import Data.Char ( intToDigit, isDigit, digitToInt )
import Data.List.Split ( split, startsWithOneOf, condense, oneOf )
import Data.Integer.Conversion ( stringToInteger )

main :: IO ()
main = do
    -- print("guh")
    -- print(characterGiver 'A' 4)
    -- print(pairGiver "A22B23D46G88")
    -- print(charAndAmountSplitter ((pairGiver "A22B23D46G88")!!0))
    -- print(charAndAmountSplitter "A22B23D46G88")

    -- print(pairGiver "A12B23C4D8e1f2g13")
    -- print(length (pairGiver "A12B23C4D8e1f2g13"))
    -- print(charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!0) )
    -- print(charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!1) )
    -- print(charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!2) )
    -- print(charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!3) )
    -- print(charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!4) )
    -- print(charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!5) )
    -- print(charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!6) )

    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!0))!!0)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!1))!!0)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!2))!!0)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!3))!!0)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!4))!!0)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!5))!!0)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!6))!!0)

    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!0))!!1)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!1))!!1)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!2))!!1)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!3))!!1)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!4))!!1)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!5))!!1)
    -- print((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!6))!!1)


    -- print(stringToInteger ((charAndAmountSplitter ((pairGiver "A12B23C4D8e1f2g13")!!1))!!1))


    -- print (decompression (pairGiver "A12B23C4D8e1f2g13") 0)
    -- print (decompression ["A5"] 0)
    -- print (length "AAAAAAAAAAAAAAAAA")
    -- print(pairGiver "A5B5C3D4E6F1G1H1I1J1j2J1")
    -- print (decompression (pairGiver "A5B5C3D4E6F1G1H1I1J1j2J1") 0)

      print (compression testString 1 1)
      print (decompression (compression testString 1 1))
    



testString::String
testString = "AAAAABBBBBCCCDDDDEEEEEEFGHIJjjJ"


characterGiver :: Char -> Integer -> String
characterGiver char count =
  if count > 1 then
    char : characterGiver char (count - 1)
  else
    [char]

charAndAmountSplitter :: String -> [String]
charAndAmountSplitter input = 
    split(condense(oneOf['0'..'9'])) input

compression :: String -> Int -> Int -> String
compression input index count =
  if index == length input - 1 then
    if input!!index /= input!!(index - 1) then
      [input!!(index - 1), intToDigit count, input!!index, intToDigit 1]
    else
      [input!!index, intToDigit (count + 1)]

  else
    if input!!index /= input!!(index - 1) then
      [input!!(index - 1), intToDigit count] ++ compression input (index + 1) 1
    else
      compression input (index + 1) (count + 1)


-- Eventjes anders designen, omdat je (als dit zou werken) niet verder zou kunnen komen dan 
-- 9 achtereenvolgende letters
  

decompression :: String -> String
decompression input =
  decode (split (startsWithOneOf ['A'..]) input) 0


decode :: [String] -> Int -> String
decode input index =    
    if index == length input - 1  {- 0 -} then 
      characterGiver 
        ((charAndAmountSplitter (input!!index))!!0!!0) 
        (stringToInteger ((charAndAmountSplitter (input!!index))!!1)) 
    else 
      characterGiver 
        ((charAndAmountSplitter (input!!index))!!0!!0) 
        (stringToInteger ((charAndAmountSplitter (input!!index))!!1))
      ++ decode input (index+1)


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





-- recursie gok ik denk ik lol

-- String bestaat uit 5x A, 5x B, 3x C, 4x D en 6x E. 
-- Als deze String door een RLE-compressie-algoritme wordt gehaald, moet het resultaat
-- dus "A5B5C3D4E6" zijn




-- Wat wil ik bereiken hier?
-- RLE-compressie
-- Hoe ga ik dat doen?
-- 1. Begin met het comprimeren van een String
-- 2. Ga daarna aan de slag met het decomprimeren van die String
-- 3. Als dat werkt, begin met het uitlezen van de data van een kleine en simpele zwart-wit afbeelding,
-- 4. Comprimeer de uitgelezen data en print deze
-- Victorie !! Het werkt !!
-- 5. Doe dit ook voor een grotere en ingewikkeldere afbeelding. 
-- 6. Mocht dit binnen de gegeven tijd zijn gelukt, zou je kunnen kijken of de compressie ook werkt voor een gif.
-- Victorie^2 !!! Het werkt nog beter !!!

