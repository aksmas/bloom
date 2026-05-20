class_name Vector5i

var _vector: Array[int]


func _init(x: int = 0, y: int = 0, z: int = 0, u: int = 0, v: int = 0) -> void:
	_vector = [x, y, z, u, v]


func vector() -> Array[int]:
	return _vector


func read(color: Constants.BloomColor) -> int:
	return _vector[color]


func write(color: Constants.BloomColor, value: int) -> void:
	_vector[color] = value


func increment(color: Constants.BloomColor, value: int = 1) -> void:
	_vector[color] += value


func add(other: Vector5i) -> Vector5i:
	var result = Vector5i.new()
	for i in range(5):
		result.write(i, read(i) + other.read(i))
	return result


func subtract(other: Vector5i) -> Vector5i:
	var result = Vector5i.new()
	for i in range(5):
		result.write(i, read(i) - other.read(i))
	return result


static func minima(a: Vector5i, b: Vector5i) -> Vector5i:
	var result = Vector5i.new()
	for i in range(5):
		result.write(i, min(a.read(i), b.read(i)))
	return result


static func maxima(a: Vector5i, b: Vector5i) -> Vector5i:
	var result = Vector5i.new()
	for i in range(5):
		result.write(i, max(a.read(i), b.read(i)))
	return result
