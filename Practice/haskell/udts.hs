main = do
  print (name facu) 
  print (area (Circle 2))

data User = User {name::String , age::Int}

facu = User {name="Facundo", age=21}

class Shape a where
  area :: a -> Double

data Circle = Circle Double
instance Shape Circle where 
  area (Circle r) = pi * r * r
