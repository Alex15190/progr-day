module Day(
  day
)where
  import Leap
  
  day::Int -> String
  day y = 
    if isLeap y then
      (pre y) ++ "12 сентября"
    else
      (pre y) ++ "13 сентября"
      
  pre::Int -> String
  pre y = "В " ++show y ++" году "
