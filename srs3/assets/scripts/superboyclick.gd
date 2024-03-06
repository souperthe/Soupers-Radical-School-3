extends Interactable

func clicked():
	owner.queue_free()
	global.superboys += 1
