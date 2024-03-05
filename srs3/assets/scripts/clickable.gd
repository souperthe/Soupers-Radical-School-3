extends Interactable


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func clicked():
	translation.x += 1
	$sound.play()


