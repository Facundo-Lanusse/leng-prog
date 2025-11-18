-- 1. Implementar un Binart Search Tree
import Data.List (foldr, foldl)
import Data.Ord as Ord

main = do 
  print (insert 2 (singleton 4))
  print (fromList [2,4,6])
  print (toList $ fromList [4,2,1])
  let m = Match "Argentina" "Uruguay"
  print m -- Imprime: Argentina vs Uruguay
  
  let m1 = createResult m 2 0
  print m1 -- Imprime: Argentina 2 Uruguay 0

  -- Ejemplo del torneo completo
  let t = Tournament [
            MatchDay "Fecha1" [Match "Argentina" "Bolivia", Match "Uruguay" "Paraguay"],
            MatchDay "Fecha2" [Match "Argentina" "Uruguay", Match "Bolivia" "Paraguay"],
            MatchDay "Fecha3" [Match "Argentina" "Paraguay", Match "Bolivia" "Uruguay"]
          ]
  print t

data BT a = Nil | BT a (BT a) (BT a)
  deriving(Show, Eq)

singleton :: a -> (BT a)
singleton val = BT val Nil Nil

insert :: (Ord a) => a -> BT a -> BT a
insert n Nil = singleton n
insert n (BT val l r) 
  | n < val = BT val (insert n l) r
  | n > val = BT val l (insert n r)
  | otherwise = (BT val l r)

fromList :: (Ord a) => [a] -> BT a
fromList = foldl (flip insert) Nil 


toList :: BT a -> [a]
toList Nil = []
toList (BT val l r) = toList l ++ [val] ++ toList r

left :: BT a -> Maybe (BT a)
left (Nil) = Nothing
left (BT _ l _) = Just l

right :: BT a -> Maybe (BT a)
right (Nil) = Nothing 
right (BT _ _ r) = Just r 

-- 2. Torneo de Futbol
-- Match continene los equipos que juegan el Match y, si ya fue juagado, el resultado del mismo

data Match = Match String String | PlayedMatch String String Int Int

-- Match implemente show sin usar deriving 
instance Show Match where
 show (Match a b) = show a ++ " vs " ++ show b
 show (PlayedMatch a b ra rb) = show a ++ " " ++ show ra ++ " " ++ show b ++ " " ++ show rb

-- Definir funcion dreateResult para crear resultados del partido 

createResult :: Match -> Int -> Int -> Match
createResult (Match a b) ra rb = PlayedMatch a b ra rb
createResult (PlayedMatch a b _ _) ra rb = PlayedMatch a b ra rb

-- Creat tipos MatchDay para definir fecha del torneo y Tournament para el torneao completo 

data MatchDay = MatchDay String [Match] 
  deriving(Show)

data Tournament = Tournament [MatchDay]
  deriving(Show)


-- Create Tournament 
-- definir funcion createTornament que dada una lista de equipos y una lista de Fechas cree un torneo siguiendo un algoritmo de round robin 

createTournament :: [String] -> [String] -> Tournament
createTornament dateNames teams = 
  Tournament (createMatchDays dateNames teams)

rotateTail :: [String] -> [String]
rotateTail [] = []
rotateTail [a] = [a]
rotateTail (ref : rest) = ref : (last rest : init rest)

generateMatch :: [String] -> [Match]
generateMatch (ref : rest) =
  let firstMatch = Match ref (head rest)

  remainingTeams = tail rest
  halfSize = length remainingTeams `div` 2

  (fistHalf, secondHalf) = splitAt halfSize remainingTeams

  otherMatches = zipWith Match fistHalf (reverse secondHalf)

  in 
    (firstMatches : otherMatches)

createMatchDays :: [String] -> [String] -> [MatchDay]
createMatchDays [] _ = []
createMatchDays (dates : remainingDates) currentTeams =
  let matchesForThisDate = generateMatch currentTeams
  
  thisMatchDay = MatchDay date matchesForThisDate

  nextTeams = rotateTail currentTeams

  remainingMatchDays = createMatchDays remainingDates nextTeams

  in 
    (thisMatchDay:remainingMatchDays)

