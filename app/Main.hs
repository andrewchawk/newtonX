module Main where

import Control.Monad
import Control.Concurrent

import Particle.Types
import Particle.Particle
import Vector.Vector
import Simulation.Simulate 

startingTime :: Time
startingTime = Time 0 

p1 = Particle 1 (Vector2 10 10000) (Vector2 0 0) 1
p2 = Particle 2 (Vector2 10 100000) (Vector2 0 0) 1

main :: IO ()
main = do
    let sleepTime = 1000000
    forever $ run [p1] startingTime sleepTime

