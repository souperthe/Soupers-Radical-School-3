extends Spatial


var canshow = false

func _process(delta):
	if canshow and owner.translation.distance_to(global.player.global_transform.origin) < global.cullingdistance:
		owner.visible = true
	else:
		owner.visible = false

func _on_VisibilityNotifier_camera_entered(camera):
	#canshow = true
	pass # Replace with function body.


func _on_VisibilityNotifier_camera_exited(camera):
	#canshow = false
	pass # Replace with function body.


func _on_VisibilityNotifier_screen_entered():
	canshow = true
	pass # Replace with function body.


func _on_VisibilityNotifier_screen_exited():
	canshow = false
	pass # Replace with function body.
