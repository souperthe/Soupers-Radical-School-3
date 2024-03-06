extends Spatial



func _on_VisibilityNotifier_camera_entered(camera):
	owner.visible = true
	pass # Replace with function body.


func _on_VisibilityNotifier_camera_exited(camera):
	owner.visible = false
	pass # Replace with function body.
