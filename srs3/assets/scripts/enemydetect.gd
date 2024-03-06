extends Area



func _on_enemydetect_body_entered(body):
	if !owner.locked:
		owner.doordetect.opendoor()
	pass # Replace with function body.
