extends Spatial

onready var player = $player


func _ready():
	$WorldEnvironment.environment.background_mode = 4
	$CanvasLayer/Control/TextureRect.visible = true
