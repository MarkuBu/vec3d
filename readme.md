## vec3d is a class library for 3d vectors.
This mod adds a 3d vector class to Minetest.

### Create a new vector
To create a new vector you have to use the method `vec3d()`

#### Example

	local v = vec3d()      -- creates the vector {x = 0, y = 0, z = 0}
	local v = vec3d(5,3,1) -- creates the vector {x = 5, y = 3, z = 1}

#### Eccess the componets

	local x = v.x
	local y = v.y
	local z = v.z

### Formatted output
If a vector is printed to the console with the `print()` command the output is formatted in the order x, y, z

#### Example

	local v1 = vec3d(5, 3, 1)
	print(v1)

The output is: `(5, 3, 1)`

### Misc functions

#### `vec3d:clone()`
Creates a copy of a vector

	local v1 = vec3d(10, 20, 2)
	local v2 = v1:clone()
	v2.x = 0
	print(v1, v2)

Prints the output `(10, 20, 2)	(0, 20, 2)`

#### `vec3d:unpack()`
Returns the single componets of the vector

	local v1 = vec3d(10, 20, 2)
	local x, y, z = v1:unpack()


### Direction helpers

#### `vec3d.up`
*   returns new unit vector pointing up (+y)

#### `vec3d.down`
*   returns new unit vector pointing down (-y)

#### `vec3d.right`
*   returns new unit vector pointing right (+x)

#### `vec3d.left`
*   returns new unit vector pointing left (-x)

#### `vec3d.forward`
*   returns new unit vector pointing forward (+z)

#### `vec3d.backward`
*   returns new unit vector pointing backward (-z)

### Basic arithmetics
This class has two methods for basic arithmetics.

#### Operators
The first uses regular math operators +, -, \*, /. The method creates a new vector as result. Both operands can be a vector or a number.

#### Example

	local v1 = vec3d(5, 3, 1)
	local v2 = vec3d(2, 4, 6)
	local v3 = v1 + v2
	print(v3)

This prints `(7, 7, 7)`

	local v1 = vec3d(5, 3, 1)
	local v2 = v1 * 5
	print(v2)

This prints `(25, 15, 5)`

#### Methodes
The second method uses a class methode to modify a vector. This method doesn't create a new vector and is slightly faster.

`x` can be a vec3d or a number

	vec3d:add(x)
	vec3d:sub(x)
	vec3d:mul(x)
	vec3d:div(x)

#### Example

	local v1 = vec3d(5, 3, 1)
	local v2 = vec3d(2, 4, 6)
	v1:add(v2)
	print(v1)

This prints `(7, 7, 7)`

### Comparing vectors
Vectors can be compared with `==`

#### Example

	local v1 = vec3d(10, 10, 10)
	local v2 = vec3d(20, 20, 20)
	print(v1 == v2)

Prints `false` to the console

### Vector functions

### `vec3d.distance(a, b)` `vec3d:distance_to(x)`
Return the distance between two vectors

##### Examples
	local v1 = vec3d(10, 20, 2)
	local v2 = vec3d(20, 30, 5)
	print(vec3d.distance(v1, v2))
	print(v1:distance_to(v2))

Both functions return `14.456832294801`

### `vec3d:len()`
Returns the real lenght of a vector

##### Examples
	local v1 = vec3d(10, 20, 2)
	print(v1:len())

Returns `22.449944320644`

### `vec3d:lenSq()`
Returns the squared lenght of a vector

##### Examples
	local v1 = vec3d(10, 20, 2)
	print(v1:lenSq())

Returns `504`

### `vec3d:normalize()` `vec3d:normalized()`
Normalizes a vector

##### Example
	local v1 = vec3d(10, 20, 2)
	v1:normalize()
	print(v1)
	---------------------------
	local v1 = vec3d(10, 20, 2)
	local v2 = v1:normalized()
	print(v2)

Returns `(0.4454354, 0.8908708, 0.08908708)`

### `vec3d:round()` `vec3d:rounded()`
Rounds a vector

##### Example
	local v1 = vec3d(10.3, 20.7, 2.6)
	v1:round()
	print(v1)
	---------------------------------
	local v1 = vec3d(10.3, 20.7, 2.6)
	local v2 = v1:rounded()
	print(v2)

Returns `(10, 21, 3)`

### `vec3d:floor()` `vec3d:floored()`
Rounds the vector down

##### Example
	local v1 = vec3d(10.3, 20.7, 2.6)
	v1:floor()
	print(v1)
	--------------------------------
	local v1 = vec3d(10.3, 20.7, 2.6)
	local v2 = v1:floored()
	print(v2)

Returns `(10, 20, 2)`
