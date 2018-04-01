module VectorMaths where

data Vector2 = Vector2 {
                       x :: Double,
                       y :: Double
                       }
                       deriving (Show)

vectorLength :: Vector2 -> Double
vectorLength v = sqrt $ x v + y v

vectorNegate :: Vector2 -> Vector2
vectorNegate v = Vector2 (negate $ x v) (negate $ y v)

vectorAdd :: Vector2 -> Vector2 -> Vector2
vectorAdd v1 v2 = Vector2 (x v1 + x v2) (y v1 + y v2)

vectorSub :: Vector2 -> Vector2 -> Vector2
vectorSub v1 v2 = Vector2 (x v1 - x v2) (y v1 - y v2)

vectorScalarMul :: Vector2 -> Double -> Vector2
vectorScalarMul v s = Vector2 (x v * s) (y v * s)

vectorDotProduct :: Vector2 -> Vector2 -> Double
vectorDotProduct v1 v2 = (x v1 * x v2) + (y v1 * y v2)

