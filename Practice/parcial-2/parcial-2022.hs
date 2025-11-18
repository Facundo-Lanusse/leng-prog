-- Run Length Encoding
import Data.List (group)
import qualified Data.Map as Map
import Data.Map (Map, lookup)

main = do
  let testScores = [(1, 6), (3, 9), (1, 8)]
  let avgMap = averageScores testScores
  
  putStrLn "--- Probando averageScores ---"
  print avgMap -- Imprime: fromList [(1,7.0),(3,9.0)]
  
  putStrLn "\n--- Probando scoreAsString ---"
  print (scoreAsString 3 avgMap) -- Imprime: "9.0"
  print (scoreAsString 2 avgMap) -- Imprime: "No Show"
  print (scoreAsString 1 avgMap) -- Imprime: "7.0"

encode :: String -> [(Int, Char)]
encode "" = []
encode str = map processGroup (group str)
  where 
    processGroup :: String -> (Int, Char)
    processGroup s = (length s,head s) 

encodeLambda :: String -> [(Int, Char)]
encodeLambda str = map (\s -> (length s, head s)) (group str)

encodeLC :: String -> [(Int, Char)]
encodeLC str = [(length s, head s) | s <- group str]

-- Usando List Comprehension que devuelva una lista de Elements

data Elements = One Char | Reapete Char Int
  deriving (Show)

encode2 :: String -> [Elements]

processTuple :: (Int, Char) -> Elements
processTuple (1, char) = One char
processTuple (count, char) = Reapete char count

encode2 str = [processTuple tuple | tuple <- encode str]

-- Ejercicio 3 : Promedio de notas por alumno 
-- 3.a. Implementar el Record Student 
-- Definimos el tipo 'Student' usando la sintaxis de Record


-- 'deriving (Show)' permite imprimirlo.
-- 'deriving (Eq)' permite compararlos (ej: student1 == student2).
data Student = Student {
  idNumber :: Int,
  name :: String
} deriving (Show, Eq)

-- 3.b. Implementar la función averageScores
averageScores :: [(Int, Int)] -> Map Int Double
average :: [Int] -> Double 

average [] = 0.0
average scores = fromIntegral (sum scores) / fromIntegral (length scores)

averageScores scoresList = Map.map average groupedScores
  where
    -- Pasa de (Int, Int) a (Int, [Int]) 
    scoresAsList = [(idNumber, [score]) | (idNumber, score) <- scoresList]
    -- Luego agrupa las notas por id concatenando la lista de los scores (si la key se repite)
    groupedScores = Map.fromListWith (++) scoresAsList

averageScores' :: [(Int, Int)] -> Map Int Double
averageScores' scoresList = Map.map average groupedScores
  where
    scoresAsList  = map (\(id, score) -> (id, [score])) scoresList
    groupedScores = Map.fromListWith (++) scoresAsList

-- 3.c. Implementar la función scoreAsString
-- Busca un Id en el mapa. Devuelve el promedio como String o "No Show".

scoreAsString :: Int -> Map Int Double -> String
scoreAsString idNumber scoresMap =
  case Map.lookup idNumber scoresMap of
    Just average -> show average
    Nothing      -> "No Show"