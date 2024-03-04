extends RayCast


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var clickable = false


# Called when the node enters the scene tree for the first time.
func _ready():
	add_exception(owner)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if is_colliding():
		var detected = get_collider()
		
		if detected is Interactable:
			clickable = true
			if owner.key_m12:
				detected.clicked()
		else:
			clickable = false
	else:
		clickable = false
		#OS.alert("WHAAT", "WHAAT")
