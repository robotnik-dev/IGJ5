extends TileMap

var oob_right: int = 7
var oob_left: int = 0
var oob_top: int = -1
var oob_bottom: int = 7

var spawn_area_top_left: Vector2i = Vector2i(3, -5)
var spawn_area_bottom_right: Vector2i = Vector2i(28, -4)

# {entity: Node2D, map_pos: Vector2i}
var occupied_cells: Dictionary = {}

func _ready() -> void:
	tile_set = TileSet.new()
	tile_set.tile_size = Vector2i(32,32)

func move_spaceship_to(map_pos: Vector2i, entity: Node2D) -> void:
	var next_pos: Vector2i = map_pos
	if next_pos.x >= oob_right or next_pos.x <= oob_left:
		next_pos.x = entity.current_map_pos.x
	
	if next_pos.y >= oob_bottom or next_pos.y <= oob_top:
		next_pos.y = entity.current_map_pos.y
	
	entity.global_position = map_to_local(next_pos)
	entity.current_map_pos = local_to_map(entity.global_position)

func move_enemy_to(map_pos: Vector2i, enemy: Node2D) -> void:
#	if map_pos in occupied_cells.values():
#		print("occupied")
	
	occupied_cells.erase(enemy)
	enemy.global_position = map_to_local(map_pos)
	enemy.current_map_pos = local_to_map(enemy.global_position)
	occupied_cells[enemy] = map_pos
