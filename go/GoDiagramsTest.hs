
import           Diagrams.Backend.Rasterific.CmdLine
import           GoDiagrams

main = mainWith $ mkBoard
  [ ".OXXX"
  , "OOOX."
  , "..OXX"
  , "O.OX."
  , "  OX."
  ]
