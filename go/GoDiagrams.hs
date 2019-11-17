
-- import           Data.ByteString                     (ByteString, getContents,
--                                                      unpack)
-- import           Data.List                           hiding ((!!))
-- import           Data.SGF
-- import           Data.Tree
-- import           Prelude                             hiding (getContents, (!!))

module GoDiagrams where

import           Diagrams.Backend.Rasterific.CmdLine
import           Diagrams.Prelude

import           Diagrams.Color.XKCD                 (yellowyBrown)

stoneRadius = 11
hoshiRadius = 2
gridSep     = 2*stoneRadius
gridLineWidth = 1

goban :: Int -> Diagram B
goban n = mconcat
  [ hoshi
  , grid
  , wood
  ]
  where
    wood = square ((fromIntegral n + 0.5) * gridSep) # fcA yellowyBrown
    grid = mconcat [ horiz, rotateBy (1/4) horiz ]
    horiz :: Diagram B
    horiz = vcat' (with & catMethod .~ Distrib & sep .~ gridSep)
            (replicate n (hrule ((fromIntegral n - 1) * gridSep)))
      # lineCap LineCapRound
      # lwL gridLineWidth
      # centerY
    hoshi = case n of
      9  -> mconcat [centerHoshi, cornerHoshi]
      13 -> mconcat [centerHoshi, cornerHoshi]
      19 -> mconcat [centerHoshi, sideHoshi, cornerHoshi]
      _  -> mempty
    centerHoshi = pip
    sideHoshi = pip
      # translateX (cornerTrans * gridSep)
      # iterateN 4 (rotateBy (1/4))
      # mconcat
    corner = case n of { 9 -> 3; _ -> 4 }
    cornerTrans = fromIntegral (n `div` 2 - corner + 1)
    cornerHoshi = pip
      # moveTo ((cornerTrans ^& cornerTrans) # scale gridSep)
      # iterateN 4 (rotateBy (1/4))
      # mconcat

    pip = circle hoshiRadius # fc black

mkBoard :: [String] -> Diagram B
mkBoard b = stones <> goban n
  where
    n = length (head b)
    stones = b
      # map (hcat' (with & catMethod .~ Distrib & sep .~ gridSep) . map drawStone)--
      # vcat' (with & catMethod .~ Distrib & sep .~ gridSep)
      # centerXY

    drawStone 'O' = circle stoneRadius # fc white
    drawStone 'X' = circle stoneRadius # fc black
    drawStone _   = mempty

------------------------------------------------------------
-- SGF parsing

-- (!!) = genericIndex

-- grabTree :: [Word8] -> TreeGo
-- grabTree s = case runParser collection () "stdin" s of
--   Right ([Game { tree = TreeGo t }], _) -> t

-- grabMoves :: TreeGo -> [MoveGo]
-- grabMoves n = [move | Right Move { move = Just (color, move) } <- mainLine]
--   where mainLine = map action . head . transpose . levels $ n

-- parse :: ByteString -> [MoveGo]
-- parse = grabMoves . grabTree . unpack

