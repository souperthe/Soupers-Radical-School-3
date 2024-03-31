extends CanvasLayer

var score = 25

func _ready():
	$Control/THING.text = str("+", score, " score!")
	$Control/AnimationPlayer.play("score")

