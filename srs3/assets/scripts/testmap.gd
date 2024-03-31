extends Spatial

onready var player = $player
var gamestarted = !global.superboys > 1
var a = false


func _ready():
	$WorldEnvironment.environment.background_mode = 4
	$CanvasLayer/Control/TextureRect.visible = true
	
	
func _process(delta):
	gamestarted = !global.superboys > 1
	$map/doorwithwall4.locked = gamestarted
	$map/doorwithwall3.locked = gamestarted
	if !gamestarted:
		if !a:
			$AudioStreamPlayer2D.stop()
			$CanvasLayer/Control/TextureRect.modulate = Color8(0, 0, 0, 255)
			$Spatial.queue_free()
			a = true
			$funstarted.play()
