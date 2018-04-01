module Simulation.Simulate where

import Control.Concurrent
import Control.Monad
import Particle.Types
import Particle.Particle

data Time = Time { getTime :: Double } deriving (Show)

updateTime :: Time -> Time
updateTime t = Time $ (getTime t) + 1

step :: [Particle] -> Int -> [Particle]
step particles n = join $ take n $ iterate ((<$>) updateParticle) particles

run :: [Particle] -> Time -> Int -> IO b
run particles t st = do
    let newParticles = updateParticle <$> particles
        newT = updateTime t
    putStrLn "\n"
    mapM_ print newParticles
    print newT
    threadDelay st
    run newParticles newT st

