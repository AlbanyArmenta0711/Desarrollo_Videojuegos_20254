extends Node2D
@export var enemy_to_spawn: PackedScene
var screen_size: Vector2
var offset = 50.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
func _on_spawn_timer_timeout() -> void:
	var player_ref = get_tree().get_nodes_in_group("Player")[0]
	var new_enemy = enemy_to_spawn.instantiate()
	var rand_pos_x = randf_range(0 + offset, screen_size.x - offset )
	var rand_pos_y = randf_range(0 + offset, screen_size.y - offset )
	var player_pos = player_ref.global_position
	while (rand_pos_x <= player_pos.x + 50 and \
		rand_pos_x >= player_pos.x - 50 and \
		rand_pos_y >= player_pos.y - 50 and \
		rand_pos_y <= player_pos.y + 50):
		rand_pos_x = randf_range(0 + offset, screen_size.x - offset )
		rand_pos_y = randf_range(0 + offset, screen_size.y - offset )
	
	new_enemy.global_position = Vector2(rand_pos_x, rand_pos_y)
	get_tree().get_current_scene().add_child(new_enemy)
