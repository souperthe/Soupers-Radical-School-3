extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var stamina
var running
var anchorY = 5
var frequency = 0.1
var amplitude = 5
var timer = 0
var timery = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if running:
		$Node2D.position.y = lerp($Node2D.position.y, 241, 0.1)
	if !running:
		$Node2D.position.y = lerp($Node2D.position.y, 450, 0.1)
	$Node2D.position.x = 123 + sin(timer*frequency)*amplitude
	timer += 0.5
	pass
