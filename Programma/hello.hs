import Data.Text.Internal.Builder.Functions (i2d)
main :: IO ()
main = do
 putStrLn (guh "guh")
  -- putStrLn(compression testString 1 1)




testString::String
testString = "AAAAABBBBBCCCDDDDEEEEEEF"

guhh::Integer
guhh = return 2

guh :: String -> Char
guh input = return input!!1


-- compression :: String Integer Integer -> String
-- compression input index count = 
--   if index == input.length
--     if(input[index])














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






