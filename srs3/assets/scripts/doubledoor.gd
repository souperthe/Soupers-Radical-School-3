extends StaticBody

export var locked = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var doordetect = $doordetect
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	#$CSGCombiner.visible = !$doordetect.opened
	if $doordetect.opened:
		$AnimationPlayer.play("open")
	if !$doordetect.opened:
		$AnimationPlayer.play("close")
	$CollisionShape.disabled = locked
	$CollisionShape.disabled = $doordetect.opened
	pass
