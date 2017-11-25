vec3d = {}
vec3d.__index = vec3d

setmetatable(vec3d, { __call = function(_, ...) return vec3d.new(...) end })

function vec3d.up()
	return vec3d.new(0, 1, 0)
end

function vec3d.down()
	return vec3d.new(0, -1, 0)
end

function vec3d.left()
	return vec3d.new(-1, 0, 0)
end

function vec3d.right()
	return vec3d.new(1, 0, 0)
end

function vec3d.forward()
	return vec3d.new(0, 0, 1)
end

function vec3d.backward()
	return vec3d.new(0, 0, -1)
end

function vec3d.__add(a, b)
	if type(a) == "number" then
		return vec3d.new(b.x + a, b.y + a, b.z + a)
	elseif type(b) == "number" then
		return vec3d.new(a.x + b, a.y + b, a.z + b)
	else
		return vec3d.new(a.x + b.x, a.y + b.y, a.z + b.z)
	end
end

function vec3d:add(b)
	if type(b) == "number" then
		self.x = self.x + b
		self.y = self.y + b
		self.z = self.z + b
	else
		self.x = self.x + b.x
		self.y = self.y + b.y
		self.z = self.z + b.z
	end
end

function vec3d.__sub(a, b)
	if type(a) == "number" then
		return vec3d.new(a - b.x, a - b.y, a - b.z)
	elseif type(b) == "number" then
		return vec3d.new(a.x - b, a.y - b, a.z - b)
	else
		return vec3d.new(a.x - b.x, a.y - b.y, a.z - b.z)
	end
end

function vec3d:sub(b)
	if type(b) == "number" then
		self.x = self.x - b
		self.y = self.y - b
		self.z = self.z - b
	else
		self.x = self.x - b.x
		self.y = self.y - b.y
		self.z = self.z - b.z
	end
end

function vec3d.__mul(a, b)
	if type(a) == "number" then
		return vec3d.new(b.x * a, b.y * a, b.z * a)
	elseif type(b) == "number" then
		return vec3d.new(a.x * b, a.y * b, a.z * b)
	else
		return vec3d.new(a.x * b.x, a.y * b.y, a.z * b.z)
	end
end

function vec3d:mul(b)
	if type(b) == "number" then
		self.x = self.x * b
		self.y = self.y * b
		self.z = self.z * b
	else
		self.x = self.x * b.x
		self.y = self.y * b.y
		self.z = self.z * b.z
	end
end

function vec3d.__div(a, b)
	if type(a) == "number" then
		return vec3d.new(a / b.x, a / b.y, a / b.z)
	elseif type(b) == "number" then
		return vec3d.new(a.x / b, a.y / b, a.z / b)
	else
		return vec3d.new(a.x / b.x, a.y / b.y, a.z / b.z)
	end
end

function vec3d:div(b)
	if type(b) == "number" then
		self.x = self.x / b
		self.y = self.y / b
		self.z = self.z / b
	else
		self.x = self.x / b.x
		self.y = self.y / b.y
		self.z = self.z / b.z
	end
end

function vec3d.__eq(a, b)
	return a.x == b.x and a.y == b.y and a.z == b.z
end

-- function vec3d.__lt(a, b)
--   return a.x < b.x or (a.x == b.x and a.y < b.y)
-- end

-- function vec3d.__le(a, b)
-- 	return a.x <= b.x and a.y <= b.y and a.z <= b.z
-- end

function vec3d.__tostring(a)
	return "(" .. a.x .. ", " .. a.y .. ", " .. a.z .. ")"
end

function vec3d.new(x, y, z)
	if type(x) == "table" then
		return setmetatable({ x = x.x or 0, y = x.y or 0, z = x.z or 0 }, vec3d)
	else
		return setmetatable({ x = x or 0, y = y or 0, z = z or 0 }, vec3d)
	end
end

function vec3d.distance(a, b)
	return (b - a):len()
end

function vec3d:distance_to(other)
	return (other - self):len()
end

function vec3d:clone()
	return vec3d.new(self.x, self.y, self.z)
end

function vec3d:unpack()
	return self.x, self.y, self.z
end

function vec3d:len()
	return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end

function vec3d:lenSq()
	return self.x * self.x + self.y * self.y + self.z * self.z
end

function vec3d:normalize()
	local len = self:len()
	self.x = self.x / len
	self.y = self.y / len
	self.z = self.z / len
end

function vec3d:normalized()
	return self / self:len()
end

function vec3d:round()
	self.x = math.floor(self.x + 0.5)
	self.y = math.floor(self.y + 0.5)
	self.z = math.floor(self.z + 0.5)
end

function vec3d:rounded()
	local x = math.floor(self.x + 0.5)
	local y = math.floor(self.y + 0.5)
	local z = math.floor(self.z + 0.5)
	return vec3d(x, y, z)
end

function vec3d:floor()
	self.x = math.floor(self.x)
	self.y = math.floor(self.y)
	self.z = math.floor(self.z)
end

function vec3d:floored()
	local x = math.floor(self.x)
	local y = math.floor(self.y)
	local z = math.floor(self.z)
	return vec3d(x, y, z)
end

-- function vec3d:rotate(phi)
--   local c = math.cos(phi)
--   local s = math.sin(phi)
--   self.x = c * self.x - s * self.y
--   self.y = s * self.x + c * self.y
--   return self
-- end

-- function vec3d:rotated(phi)
--   return self:clone():rotate(phi)
-- end

-- function vec3d:perpendicular()
--   return vec3d.new(-self.y, self.x)
-- end
--
-- function vec3d:projectOn(other)
-- 	return (self * other) * other / other:lenSq()
-- end
--
-- returns a vector with a specific length
function vec3d:set_length(l)
	return (self:normalized() * l)
end

-- limits the length of a vector
function vec3d:limit(l)
	if self:len() > l then
		return self:set_length(l)
	end
	return self
end

-- returns the cross product of two vectors
function vec3d:cross(other)
	return vec3d.new(self.y * other.z - self.z * other.y,
		self.z * other.x - self.x * other.z,
		self.x * other.y - self.y * other.x)
end

-- returns the dot product of two vectors
function vec3d:dot(other)
	return self.x * other.x + self.y * other.y + self.z * other.z
end

function vec3d:scalar_projection(a, b)
	local ap = self - a
	local ab = b - a
	ab:normalize()
	ab = ab * ap:dot(ab)
	return (a + ab)
end

-- function vec3d:is_between(a, b)
-- 	local ab = b - a
-- 	local ap = self - a
-- 	-- local l = ap:len()
-- 	local dot = math.abs(ap:dot(ab))
-- 	-- print(a, b, self, dot)
-- 	if ap:len() < ab:len() and dot > 0.9 and dot < 1.1 then
-- 		return true
-- 	end
-- 	return false
-- end

function vec3d:is_between(a, b)
	local ab = b - a
	local ap = self - a
	local lp = ap:len()
	local lb = ab:len()
	local dot = ap:dot(ab) / (lp * lb)
	return lp < lb and dot > 0.95
end

-- returns the scalar triple product of three vectors
-- function vec3d.scalar_triple(a, b, c)
-- 	return a:dot(b:cross(c))
-- end

-- returns the angle between two 2d vectors (x,z) in radians
-- y from a 3d vector is ignored
function vec3d.angle_between_2d(a, b)
	return math.atan2(a.x * b.z - a.z * b.x, a.x * b.x + a.z * b.z)
end

-- returns yaw from a 2d vector (x, z) in radians
-- y from a 3d vector is ignored
function vec3d:yaw()
	local yaw = math.atan2(-self.x, self.z)
	if yaw >= -math.pi and yaw < 0 then
		yaw = math.pi * 2 + yaw
	end
	return yaw
end

-- Test code ----------------------
-- local v1 = vec3d(10, 10, 10)
-- print(v1:len())
-- v1:set_length(1.1)
-- print(v1:len())
