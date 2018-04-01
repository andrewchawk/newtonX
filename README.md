# NewtonX

This is a Newtonian, rigid body physics engine.

Wanted to call this PhysX, but Nvidia already have a physics engine by that name. 

## Usage

A particle consists of a position (a Vector2), a velocity (a Vector2), and a mass (a double).

```
let p1 = Particle (Vector2 10 20) (Vector2 5 0) 2
```

says that there is a particle at position (x: 10, y: 20) with a velocity (x: 5, y: 0) and a mass of 2.

```
stack build
stack exec newtonX
```
