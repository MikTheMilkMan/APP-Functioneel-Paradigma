{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use guards" #-}

import Data.Char ( intToDigit, isDigit )
import Data.List.Split ( split, startsWithOneOf )


main :: IO ()
main = do
  -- print(compression testString 1 1)
  -- print(characterGiver 'A' 4)
  print(valueSeparator "A111B11C1D3" 0)
  -- print (decompression "A5B5C3D4E6F1G1H1I1J1" 0)
  print("guh")



testString::String
testString = "AAAAABBBBBCCCDDDDEEEEEEFGHIJjjJ"



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


-- decompression :: String -> Int -> String
-- decompression input index =
-- -- if input!!index+2 == getal, ga naar aparte functie om hier een getal van te maken
--   if index == length input - 1 then
--     characterGiver (input!!index) (read input!!(index+1) :: Int)
--   else
--     if  isDigit (input!!(index+2)) then
--     else
--     characterGiver (input!!index) (read input!!(index+1) :: Int) ++ decompression input (index+2)



valueSeparator :: String -> Int -> String
valueSeparator input index =
  split (startsWithOneOf ['a'..'Z']) input


--   if index == length input - 1 then
  
--   else
--     if isDigit (input!!(index+1)) then
--       input!!(index+1) : amountCompleter input (index+1)
--     else
--       [input!!(index+1)] 


characterGiver :: Char -> Int -> String
characterGiver char count =
  if count > 1 then
    char : characterGiver char (count - 1)
  else
    [char]

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

