extends Node


func _load_csv(
    path: String, 
    instantiator: Callable = func(values): return values
) -> Array:
    var data = []
    var file = FileAccess.open(path, FileAccess.READ)
    while not file.eof_reached():
        var line = file.get_line()
        var values = line.split(",")
        data.append(instantiator.call(values))
    file.close()
    return data


func _load_plant(info: Array) -> PlantInfo:
    return PlantInfo.new()


func _load_butterfly(info: Array) -> ButterflyInfo:
    return ButterflyInfo.new()


func _ready():
    pass

