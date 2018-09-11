module Leap(
  isLeap
)where
  isLeap::Int->Bool
  isLeap y = (y `mod` 4 == 0) && (y `mod` 100 /= 0) || (y `mod` 400 == 0)
  
