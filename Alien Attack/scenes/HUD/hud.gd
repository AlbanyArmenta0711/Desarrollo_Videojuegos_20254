extends CanvasLayer

@onready var score_label: Label = $MarginContainer/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_score_update.connect(update_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_score(new_score: int):
	print("Actualiza el score!" + str(new_score))
	score_label.text = "Score: " + str(new_score)
	
