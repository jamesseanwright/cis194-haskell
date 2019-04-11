{-# LANGUAGE OverloadedStrings #-}
import CodeWorld

main :: IO ()
tree :: Picture -> Integer -> Picture
blossom :: Double -> Picture
animation :: Double -> Picture

blossom time = colored green (solidCircle ((min time 3) / 17))

tree branchEnd 0 = branchEnd
tree branchEnd n = polyline [(0, 0), (0, 1)]
  & translated 0 1 (rotated (pi / 10) (tree branchEnd (n - 1))
  & rotated (-pi / 10) (tree branchEnd (n - 1)))
  
animation time = tree (blossom time) 8;

main = animationOf animation
