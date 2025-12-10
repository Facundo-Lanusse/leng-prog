import Data.List

main = do 
  
  print ((take 1 "abc", drop 1 "abc"))

myLast :: [a] -> a
myLast [] = error "empty list"
myLast [a] = a
myLast (_:xs) = myLast xs


myButLast :: [a] -> a
myButLast = last . init -- f(g(x)) = last (init)

myButLast' x = reverse x !! 1 -- da vuelta la lita toma el elemento que tiene indice 1

elementAt :: [a] -> Int -> a
elementAt list i = list !! (i-1)
--Recursivo
elementAt' (x:_) 1 = x --punto de corte
elementAt' (_:xs) i = elementAt' xs (i - 1)
elementAt' _ _ = error "index out of bounds"

myLength:: [a] -> Int
myLength [] = 0
myLength list = length list
--Recursive--
myLength' [] = 0
myLength' (_:xs) = 1 + myLength' xs

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome list = reverse list == list

data NestedList a = Elem a | List [NestedList a]
flatten :: NestedList a -> [a]
flatten (Elem a) = [a]
flatten (List (x:xs)) = flatten x ++ flatten (List xs)
flatten (List []) = []

--Compress aaabbbccc to (A B C)
compress:: (Eq a) => [a] -> [a]
-- group agrupa elementos consecutivos 
-- map head -> le aplica head a cada elemento de la list entonces toma el primer elemento de cada grupo 
compress = map head . group
--foldr
compress' :: (Eq a) => [a] -> [a]
compress' = foldr skipDup []
      where skipDup x [] = [x]
            skipDup x xs
                  | x == head xs = xs
                  | otherwise = x : xs

--Run-length encode
encode:: (Eq a) => [a] -> [(Int, a)]
encode = map(\x -> (length x, head x)) . group
encode'' xs =
  let groups = group xs
  in map (\x -> (length x, head x)) groups
encode' xs = [(length x, head x) | x <- group xs]

-- --encodeModified "aaaabccaadeeee"
-- [Multiple 4 'a',Single 'b',Multiple 2 'c', Multiple 2 'a',Single 'd',Multiple 4 'e']
data Groups a = Single a | Multiple Int a
  deriving(Show)
encodeModify :: (Eq a) => [a] -> [Groups a]
enc xs = [(length x, head x) | x <- group xs]
encodeModify xs = map encodeHelper (enc xs)
                      where encodeHelper (1, x) = Single x
                            encodeHelper (n, x) = Multiple n x 

decodeModified :: (Eq a) => [Groups a] -> [a]
decodeModified [] = []
decodeModified ((Single x):xs) = x: decodeModified xs
decodeModified ((Multiple 2 x) : xs ) = x:x: decodeModified xs
decodeModified ((Multiple n x):xs) = x: decodeModified ((Multiple (n-1) x):xs)

-- Replican n times
repli :: [a] -> Int -> [a]
repli xs n = concatMap (replicate n) xs