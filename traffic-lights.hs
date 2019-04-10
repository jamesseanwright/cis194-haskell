{-# LANGUAGE OverloadedStrings #-}
import CodeWorld

trafficController :: Double -> Picture
lowerCircle :: Color -> Picture
upperCircle :: Color -> Picture
frame :: Picture
trafficLight :: Bool -> Picture
trafficLights :: Integer -> Bool -> Picture

lowerCircle colour = colored colour (translated 0 (-1.5) (solidCircle 1))
upperCircle colour = colored colour (translated 0 (1.5) (solidCircle 1))
frame = rectangle 2.5 5.5

trafficLight True = lowerCircle green & upperCircle black & frame
trafficLight False = lowerCircle black & upperCircle red & frame

trafficLights 0 _ = blank
trafficLights len state = trafficLight state & translated 3 0 (trafficLights (len - 1) state)

trafficController time
  | round (time / 3) `mod` 2 == 0 = trafficLights 3 True
  | otherwise = trafficLights 3 False

main :: IO ()
main = animationOf trafficController
