extends CanvasLayer

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var continue_label: Label = $MarginContainer/VBoxContainer/ContinueLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_player_defeated.connect(show_game_over)

func show_game_over():
	get_tree().paused = true
	visible = true 
	anim_player.play("game_over_anim")
	continue_label.visible = true
	anim_player.queue("space_modulate")
	
