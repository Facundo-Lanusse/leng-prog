-- 1. Palíndromos
-- Chequea si es palindromo ignorando espacios, puntuacion y case
import Data.Char (toLower, isAlpha)

main = do
  print (isPalindrome "")
  print (isPalindrome "a")
  print (isPalindrome "madam")
  print (isPalindrome "Sir")
  print (isPalindrome "Madam")
  print (isPalindrome "A man, a plan, a canal, Panama")
  print (filterMap (\x -> if x >= 0 then Just (x*x) else Nothing) [-1, 2, -3, 4])
  print (right t1)
  print (value t1)
  print (show t1)

isPalindrome :: String -> Bool
isPalindrome str = cleanStr == reverse cleanStr
  where
    cleanStr = [ toLower char | char <- str, isAlpha char ]

-- 2. Filter and Map using List Comprehensions
-- Objetivo: Implementar filterMap :: (a -> Maybe b) -> [a] -> [b]. Esta función debe aplicar una función f a cada elemento de una lista. Si f devuelve Nothing, se descarta. Si f devuelve Just b, se incluye b en la lista final. Se debe usar List Comprehension.
filterMap :: (a -> Maybe b) -> [a] -> [b]
-- Esto se lee como:
  -- "Crea una lista de 'b's ...
  -- 1. ... tomando cada 'x' de la lista 'xs' ...
  -- 2. ... luego, aplica 'f' a 'x'. Esto da un 'Maybe b'.
  -- 3. ... [f x] crea una lista temporal (ej: [Just 4] o [Nothing])
  -- 4. ... 'Just b <- [f x]' es el truco:
  --    - Si [f x] es [Nothing], el patrón 'Just b' falla.
  --      ¡No hay 'match' y NADA se agrega a la lista (se filtra)!
  --    - Si [f x] es [Just 4], el patrón 'Just b' tiene éxito.
  --      'b' se "ata" (binds) al valor 4 (se mapea y desenvuelve).
  -- 5. ... y 'b' (el 4) se agrega a la lista final."
filterMap function list = [ b | element <- list, Just b <- [function element]]

-- 3. A Tree
-- 3.1 Implementa estructura basica de un arbol

data Tree a = Leaf a | Node (Tree a) a (Tree a)


t1 :: Tree Char
t1 = Node (Leaf 'x') 'y' (Leaf 'z')            

left :: Tree a -> Maybe (Tree a)
left (Leaf _) = Nothing 
left (Node l _ _) = Just l

right :: Tree a -> Maybe (Tree a)
right (Leaf _) = Nothing 
right (Node _ _ r) = Just r

value :: Tree a -> a
vaule (Leaf v) = v
value (Node _ v _) = v

-- 3.2 Hacer Tree una instancia de Show
-- Objetivo: Implementar Show para que los árboles se impriman de forma personalizada.

instance Show a => Show (Tree a) where 
  show (Leaf a) = show a
  show (Node l v r) = "(" ++ show l ++ " " ++ show v ++ " " ++ show r ++ ")"

