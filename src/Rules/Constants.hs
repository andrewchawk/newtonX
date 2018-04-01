module Rules.Constants where

import Particle.Types

gravityAcc :: Acceleration
gravityAcc = -9.81

deltaTime :: Double
deltaTime = 1

force :: Mass -> Acceleration -> Force
force m a = m * a

