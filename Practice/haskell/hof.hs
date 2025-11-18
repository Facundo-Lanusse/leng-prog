main = do
  print (applyTwice sqrt 16)
  print (reverseList list)
  print (length list)
  print (reverse list)
  print (drop (length list -1) list)
  print (take (length list -1 ) list)

applyTwice function value = function (function value)

list = [1,2,3,4,5]
reverseList = foldl (\acumulator head -> head:acumulator) []
prueba = [1,2,3]


