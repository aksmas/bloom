class_name VectorPlants

var _plants: Array[Array]


func _init() -> void:
    _plants = [[], [], [], [], []]


func add(plant: PlantInfo) -> void:
    _plants[plant.color].append(plant)


func read(color: Constants.BloomColor) -> Array[PlantInfo]:
    return _plants[color]


func vector() -> Vector5i:
    var result := Vector5i.new()
    for i in range(5):
        result.write(i, read(i).size())
    return result
