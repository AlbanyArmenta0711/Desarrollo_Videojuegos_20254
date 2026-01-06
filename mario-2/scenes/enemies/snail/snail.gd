extends CharacterBody2D

#Referencias a los nodos en escena
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var floor_detector: RayCast2D = $FloorDetection
@onready var wall_detector: RayCast2D = $WallDetection

#Constantes de Movimiento
const GRAVITY: float = 1000.0 
const MOVEMENT_SPEED: float = 180.0

enum FACING_DIRECTION {LEFT = -1, RIGHT = 1}
var facing: FACING_DIRECTION = FACING_DIRECTION.LEFT

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else: 
		velocity.x = MOVEMENT_SPEED * facing * delta
		if wall_detector.is_colliding() or not floor_detector.is_colliding(): 
			flip_snail()
			
func flip_snail():
	if facing == FACING_DIRECTION.LEFT:
		facing = FACING_DIRECTION.RIGHT
	else: 
		facing = FACING_DIRECTION.LEFT
	
	wall_detector.target_position *= -1
	floor_detector.position.x = floor_detector.position.x * -1 
	anim_sprite.flip_h = !anim_sprite.flip_h
	
			
			
			
			
			
			
			
			
			
			
