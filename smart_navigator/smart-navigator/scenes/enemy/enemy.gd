extends CharacterBody2D

@export var movement_speed = 500.0
@export var destinations: Array[Marker2D]
@onready var nav_agent = $NavigationAgent2D
@onready var wait_timer = $WaitTimer

var destination_idx: int
var should_move: bool

func _ready() -> void:
	destination_idx = 0 
	setup_destination.call_deferred()
	
func setup_destination():
	await get_tree().physics_frame
	if destinations.size() >= 1:
		var first_destination: Marker2D = destinations[0]
		nav_agent.target_position = first_destination.position
		print(nav_agent.distance_to_target())
		print(nav_agent.target_position)
		destination_idx += 1
		should_move = true

func _physics_process(delta: float) -> void:
	if should_move:
		if nav_agent.is_navigation_finished():
			should_move = false
			if destination_idx < destinations.size():
				var destination: Marker2D = destinations[destination_idx]
				destination_idx += 1 
				nav_agent.target_position = destination.position
				print(nav_agent.distance_to_target())
				print(nav_agent.target_position)
				wait_timer.start()
			return 
			
		var current_agent_position: Vector2 = global_position
		var next_path_position: Vector2 = nav_agent.get_next_path_position()
		velocity = current_agent_position.direction_to(next_path_position) * movement_speed * delta
		move_and_slide()
		

func _on_wait_timer_timeout() -> void:
	should_move = true 
