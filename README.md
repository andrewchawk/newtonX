# NewtonX

This is a Newtonian, rigid body physics engine.

The engine is Newtonian because it implements Newton's three laws of motion: 

1. Objects persist in their current state unless compelled to change by external forces.
2. Force is equal to mass times accerleration.
3. Actions imply equal and opposite reactions.

(Wanted to call this PhysX, but Nvidia already have a physics engine by that name.)

## Usage

### Particles (Particle.Particle)

A particle consists of a position (a Vector2), a velocity (a Vector2), and a mass (a double). To create a particle, use the `Particle` data type:

```
import Particle.Particle

let p1 = Particle (Vector2 10 20) (Vector2 5 0) 2
```

This says that there is a particle at position (x: 10, y: 20) with a velocity (x: 5, y: 0) and a mass of 2.

### Simulation (Simulation.Simulation)

Available in `Simulation.Simulate` are two functions, `run` and `step`. `run` will run through the simulation, never stopping; it takes a list of particles, a time object, and some time to sleep for in microseconds.

```
import Simulation.Simulate

startingTime :: Time
startingTime = Time 0

p1 :: Particle
p1 = Particle (Vector2 10 20) (Vector2 5 0) 2

main :: ()
main = do
    let sleepTime = 1000000
    run [p1] startingTime sleepTime
```

This will step through the simulation with a gap (specified by the sleep value) between each step:

```
Particle {pid = 1, position = Vector2 {x = 10.0, y = 9990.19}, velocity = Vector2 {x = 0.0, y = -9.81}, mass = 1.0}
Time = {getTime = 1.0}

Particle {pid = 1, position = Vector2 {x = 10.0, y = 9970.57}, velocity = Vector2 {x = 0.0, y = -19.62}, mass = 1.0}
Time = {getTime = 2.0}
```

Alternatively, you can use `step`, specifying the particles and number of times to run through the simulation.

```
import Simulation.Simulate

p1 = Particle 1 (Vector2 10 10000) (Vector2 0 0) 1
p2 = Particle 2 (Vector2 10 100000) (Vector2 0 0) 1

step [p1, p2] 5
```

which will run through the simulation 5 times for particles 1 and 2:

```
[Particle {pid = 1, position = Vector2 {x = 10.0, y = 10000.0}, velocity = Vector2 {x = 0.0, y = 0.0},mass = 1.0},Particle {pid = 2, position = Vector2 {x = 10.0, y = 100000.0}, velocity = Vector2 {x = 0.0, y = 0.0}, mass = 1.0},Particle {pid = 1, position = Vector2 {x = 10.0, y = 9990.19}, velocity = Vector2 {x = 0.0, y = -9.81}, mass = 1.0},Particle {pid = 2, position = Vector2 {x = 10.0, y = 99990.19}, velocity = Vector2 {x = 0.0, y = -9.81}, mass = 1.0},Particle {pid = 1, position = Vector2 {x = 10.0, y = 9970.57}, velocity = Vector2 {x = 0.0, y = -19.62}, mass = 1.0},Particle {pid = 2, position = Vector2 {x = 10.0, y = 99970.57}, velocity = Vector2 {x = 0.0, y = -19.62}, mass = 1.0},Particle {pid = 1, position = Vector2 {x = 10.0, y = 9941.14}, velocity = Vector2 {x = 0.0, y = -29.43}, mass = 1.0}, Particle {pid = 2, position = Vector2 {x = 10.0, y = 99941.14000000001}, velocity = Vector2 {x = 0.0, y = -29.43}, mass = 1.0},Particle {pid = 1, position = Vector2 {x = 10.0, y = 9901.9}, velocity = Vector2 {x = 0.0, y = -39.24}, mass = 1.0},Particle {pid = 2, position = Vector2 {x = 10.0, y = 99901.90000000001}, velocity = Vector2 {x = 0.0, y = -39.24}, mass = 1.0}]
```

## Build 

Build with stack:

```
stack build
stack exec newtonX
```
