extends Interactable

var opened = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func clicked():
	opendoor()
		
func opendoor():
	if !opened:
		opened = true
		$sound.play()
		$Timer.start()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	opened = false
	$sound2.play()
	pass # Replace with function body.
