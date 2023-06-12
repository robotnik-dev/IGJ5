extends TileMap

signal enemy_alignment_changed

var oob_right: int = 7
var oob_left: int = -1
var oob_top: int = -1
var oob_bottom: int = 6

var spawn_area_top_left: Vector2i = Vector2i(3, -5)
var spawn_area_bottom_right: Vector2i = Vector2i(28, -4)

var global_alignment: AlignmentComponent.Alignment = AlignmentComponent.Alignment.WHITE:
	set(value):
		global_alignment = value
		enemy_alignment_changed.emit()

# {entity: Node2D, map_pos: Vector2i}
var occupied_cells: Dictionary = {}

func _ready() -> void:
	tile_set = TileSet.new()
	tile_set.tile_size = Vector2i(32,32)

func change_global_alignment() -> void:
	var enemies = get_tree().get_nodes_in_group("Enemy")
	for enemy in enemies:
		enemy.change_alignment()
	match global_alignment:
		AlignmentComponent.Alignment.WHITE:
			global_alignment = AlignmentComponent.Alignment.BLACK
		AlignmentComponent.Alignment.BLACK:
			global_alignment = AlignmentComponent.Alignment.WHITE

func move_spaceship_to(map_pos: Vector2i, entity: Node2D) -> void:
	var next_pos: Vector2i = map_pos
	if next_pos.x >= oob_right or next_pos.x <= oob_left:
		next_pos.x = entity.current_map_pos.x
	
	if next_pos.y >= oob_bottom or next_pos.y <= oob_top:
		next_pos.y = entity.current_map_pos.y
	
	entity.global_position = map_to_local(next_pos)
	entity.current_map_pos = local_to_map(entity.global_position)

func move_enemy_to(map_pos: Vector2i, enemy: Node2D) -> void:
	enemy.global_position = map_to_local(map_pos)
	enemy.current_map_pos = local_to_map(enemy.global_position)
