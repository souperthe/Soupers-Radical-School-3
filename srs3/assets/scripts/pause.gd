extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	$pauseffects.visible = false
	$pausestuff.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		$pause.play()
		paused = !paused
		get_tree().paused = !get_tree().paused
		$pauseffects.visible = !$pauseffects.visible
		$pausestuff.visible = !$pausestuff.visible
		if paused:
			 Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if !paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass
