extends TileMap

func _ready() -> void:
	tile_set = TileSet.new()
	tile_set.tile_size = Vector2i(32,32)
