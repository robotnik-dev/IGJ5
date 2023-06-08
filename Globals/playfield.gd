extends TileMap

var oob_right: int = 29
var oob_left: int = 2
var oob_top: int = 2
var oob_bottom: int = 25

func _ready() -> void:
	tile_set = TileSet.new()
	tile_set.tile_size = Vector2i(8,8)
