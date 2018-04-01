module Main where

import Control.Monad
import Control.Concurrent

data Vector2 = Vector2 {
                       x :: Double,
                       y :: Double
                       }
                       deriving (Show)

data Particle = Particle {
                         pid :: Int,
                         position :: Vector2,
                         velocity :: Vector2,
                         mass :: Mass 
                         }
                         deriving (Show)

data Time = Time { getTime :: Int } deriving (Show)

type Mass = Double
type Acceleration = Double
type Force = Double

deltaTime :: Double
deltaTime = 1

force :: Mass -> Acceleration -> Force
force m a = m * a

forceOfGravity :: Mass -> Force
forceOfGravity m = m * (-9.81)

time :: Time
time = Time 1

calcVelocity :: Particle -> Particle
calcVelocity p = 
    Particle (pid p)
             (position p) 
             (Vector2 (xV + xAccerlation) (yV + yAccerlation)) 
             (mass p)
    where
        xV = x $ velocity p
        yV = y $ velocity p
        force = forceOfGravity $ mass p
        xAccerlation = (0 / mass p) * deltaTime
        yAccerlation = (force / mass p) * deltaTime

calcPosition :: Particle -> Particle
calcPosition p = 
    Particle (pid p)
             (Vector2 xPosition yPosition)
             (velocity p)
             (mass p)
    where
        pPosition = position p
        xPosition = ((x $ pPosition) + (x $ velocity p)) * deltaTime 
        yPosition = ((y $ pPosition) + (y $ velocity p)) * deltaTime

updateParticle :: Particle -> Particle
updateParticle = calcPosition . calcVelocity

updateTime :: Time -> Time
updateTime t = Time ((getTime t) + 1)

particle1 = Particle 1 (Vector2 10 10000) (Vector2 0 0) 1

run :: [Particle] -> Time -> IO b
run particles t = do
    let newParticles = updateParticle <$> particles
        newT = updateTime t
    mapM_ print newParticles
    print newT
    threadDelay 1000000
    run newParticles newT

main :: IO ()
main = do
    forever $ run [particle1] time

