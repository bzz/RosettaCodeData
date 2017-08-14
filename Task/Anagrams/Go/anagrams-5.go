import Data.List (groupBy, maximumBy, sort)
import Data.Text (pack)
import Data.Ord (comparing)

main :: IO ()
main = do
  f <- readFile "./unixdict.txt"
  let ws =
        groupBy
          (\(a, _) (b, _) -> a == b)
          (sort (((,) =<< pack . sort) <$> lines f))
  mapM_
    (print . fmap snd)
    (filter ((length (maximumBy (comparing length) ws) ==) . length) ws)
