extends Area2D

class_name PlayerBullet
var direction = Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * delta * 100.0

func on_bullet_exited() -> void:
	queue_free()
