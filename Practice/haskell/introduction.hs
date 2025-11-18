main = do
  print (triple 5)


succs :: Int -> Int
succs n = n + 1
square n = n * n
max2 :: Int -> Int -> Int
max2 a b = 
  if a > b
    then a
    else b

max3 :: Int -> Int -> Int -> Int
max3 a b c 
  | a > b && a > c = a
  | b > c          = b
  | otherwise      = c

max4 a b c d = max2 max12 max34
  where
    max12 = max2 a b
    max34 = max2 c d

fibo = [1,1,2,3,5]
fact = [1,2,6,24,120]

list = [1,2,3,4,5]
recursiveSum [] = 0
recursiveSum (head:tail) = head + recursiveSum tail

multiply x y = x * y
triple x = multiply 3 x