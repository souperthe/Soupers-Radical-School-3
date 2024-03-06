extends Spatial

export var locked = false


func _process(delta):
	$door2.locked = locked
