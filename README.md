# NewtonX

This is a Newtonian, rigid body physics engine.

Wanted to call this PhysX, but Nvidia already have a physics engine by that name. 

## Usage

At the moment, you can run a simulation running `main` in ghci or running the executable (`stack exec newtonX`) which will step through the simulation with a second gap between each step without ever stopping. Alternatively, you can run `step` in ghci, specifying the particles and number of times to run through the simulation.

```
step [particle1, particle2] 10
```

which will run through the simulation 10 times for particles 1 and 2.

A particle consists of a position (a Vector2), a velocity (a Vector2), and a mass (a double).

```
let p1 = Particle (Vector2 10 20) (Vector2 5 0) 2
```

says that there is a particle at position (x: 10, y: 20) with a velocity (x: 5, y: 0) and a mass of 2.

```
stack build
stack exec newtonX
```
