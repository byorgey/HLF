
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

main = mainWith (goban 9)
