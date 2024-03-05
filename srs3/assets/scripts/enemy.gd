class_name Enemy
extends KinematicBody

export var speed = 5


var path = []
var cur_path_idx = 0
var target = null
var velocity = Vector3.ZERO
var threshold = .1

onready var nav = get_parent()

func _ready():
	yield(owner, "ready")
	target = owner.player
	
func _physics_process(delta):
	if path.size() > 0:
		move_to_target()
		
func move_to_target():
	if cur_path_idx >= path.size():
		return
		
	if global_transform.origin.distance_to(path[cur_path_idx]) < threshold:
		cur_path_idx += 1
		
	else:
		var direction = path[cur_path_idx] - global_transform.origin
		velocity = direction.normalized() * speed
		move_and_slide(velocity, Vector3.UP)
		
		
func get_target_path(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	cur_path_idx = 0
	
	

func _on_Timer_timeout():
	get_target_path(target.global_transform.origin)
	pass # Replace with function body.
