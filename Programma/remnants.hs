-- compression' input index count
--   | index == input.length = if input [index] != input [index - 1] then
--       return input [index - 1] + count + input [index] + 1
--     else
--       return input [index] + (count + 1)
--   | input [index] != input [index - 1] = return input [index - 1] + count + (compression' input index + 1 1)
--   | otherwise = return compression' input (index + 1) (count + 1)



-- compression input index count
--   | index == input.length = if input [index] != input [index - 1] then
--       return input [index - 1] + count + input [index] + 1
--     else
--       return input [index] + (count + 1)
--   | input [index] != input [index - 1] = return input [index - 1] + count + (compression input index + 1 1)
--   | otherwise = return (compression input index + 1 count + 1)

-- compression :: String Integer Integer -> String
-- compression input index count
--   | index == input.length
--   = input index count | input[index] == input[index - 1]
--   = 