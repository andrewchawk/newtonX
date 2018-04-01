module Particle.Types where

import Vector.Vector

data Particle = Particle {
                         pid :: Int,
                         position :: Vector2,
                         velocity :: Vector2,
                         mass :: Mass 
                         }
                         deriving (Show)

type Mass = Double
type Acceleration = Double
type Force = Double

