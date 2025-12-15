extends CharacterBody2D

@onready var player: Player 
@onready var shoot_marker: Marker2D = $Marker2D

func _ready() -> void:
	player = get_tree().get_nodes_in_group("Player")[0]
	
func _process(delta: float) -> void:
	look_at(player.global_position)

func _on_damage_received(area: Area2D) -> void:
	GameManager.on_enemy_destroy()
	queue_free()

func _on_shoot_timer_timeout() -> void:
	ObjectMaker.create_enemy_bullet(rotation, shoot_marker.global_position)
	
