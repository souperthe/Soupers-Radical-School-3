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
	if $pausestuff/resume2.is_hovered():
		$pausestuff/resume.modulate.r8 = 255
		$pausestuff/resume.modulate.b8 = 0
		$pausestuff/resume.modulate.g8 = 0
	if !$pausestuff/resume2.is_hovered():
		$pausestuff/resume.modulate.r8 = 255
		$pausestuff/resume.modulate.b8 = 255
		$pausestuff/resume.modulate.g8 = 255
	if $pausestuff/title.is_hovered():
		$pausestuff/exit.modulate.r8 = 255
		$pausestuff/exit.modulate.b8 = 0
		$pausestuff/exit.modulate.g8 = 0
	if !$pausestuff/title.is_hovered():
		$pausestuff/exit.modulate.r8 = 255
		$pausestuff/exit.modulate.b8 = 255
		$pausestuff/exit.modulate.g8 = 255
	pass


func _on_resume_meta_hover_started(meta):
	$pausestuff/resume.modulate.r8 = 255
	$pausestuff/resume.modulate.b8 = 0
	$pausestuff/resume.modulate.g8 = 0
	pass # Replace with function body.


func _on_Button_pressed():
	#$pause.play()
	paused = !paused
	get_tree().paused = !get_tree().paused
	$pauseffects.visible = !$pauseffects.visible
	$pausestuff.visible = !$pausestuff.visible
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#get_tree().quit()
	pass # Replace with function body.


func _on_title_pressed():
	get_tree().change_scene("res://assets/scenes/titlescreen.tscn")
	pass # Replace with function body.
