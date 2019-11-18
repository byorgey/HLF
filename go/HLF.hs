import           Diagrams.Backend.Rasterific.CmdLine
import           GoDiagrams

main = mainWith $
  [ ("19x19-blank", goban 19)
  , ("5x5-example", mkBoard
      [ ".OXXX"
      , "OOOX."
      , "..OXX"
      , "O.OX."
      , "  OX."
      ]
    )
  ]
