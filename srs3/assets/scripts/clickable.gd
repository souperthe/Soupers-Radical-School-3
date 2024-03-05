extends Interactable


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func clicked():
	#translation.x += 1
	playcock()
	$sound.play()


func playcock():
	var whiteflash = preload("res://assets/objects/physics ball.tscn")
	var ghost: RigidBody = whiteflash.instance()
	#roomhandle.currentscene.add_child(ghost)
	get_tree().get_current_scene().add_child(ghost)
	ghost.translation = self.translation
	ghost.linear_velocity.x = rand_range(20,-20)
	ghost.linear_velocity.z = rand_range(20,-20)
	ghost.linear_velocity.y = rand_range(5,10)
	pass
