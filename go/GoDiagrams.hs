
module GoDiagrams where

import           Diagrams.Backend.Rasterific.CmdLine
import           Diagrams.Prelude

import           Diagrams.Color.XKCD

stoneRadius = 0.5
gridSep     = 2*stoneRadius

goban :: Int -> Diagram B
goban n = mconcat
  [ wood
  , grid
  , hoshi
  ]
  where
    wood = square (fromIntegral n * gridSep) # yellowyBrown
    grid = mconcat [ horiz, rotateBy (1/4) horiz ]
    horiz = vcat' (with & catMethod .~ Distrib & sep .~ gridSep)
            (replicate n (hrule ((fromIntegral n - 1) * gridSep)))
    hoshi = case n of
      9  -> mconcat [centerHoshi, cornerHoshi]
      13 -> mconcat [centerHoshi, cornerHoshi]
      19 -> mconcat [centerHoshi, sideHoshi, cornerHoshi]
      _  -> mempty
    centerHoshi = dot # moveTo (fromIntegral (n `div` 2) ^& fromIntegral (n `div` 2))
    sideHoshi = mempty
    cornerHoshi = mempty

main = mainWith (goban 19)
