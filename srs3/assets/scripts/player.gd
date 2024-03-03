class_name Player
extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var head = $head
var look_rot = Vector3.ZERO
var move_dir = Vector3.ZERO
var velocity = Vector3.ZERO
var maxangle = 90
var minangle = -80
var movespeed = 0.15
var gravity = 0.02
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseMotion:
		look_rot.y -= (event.relative.x * global.mousesens)
		look_rot.x -= (event.relative.y * global.mousesens)
		look_rot.x = clamp(look_rot.x, minangle, maxangle)

func _process(delta):
	get_inputs()
	pass


func _physics_process(delta):
	head.rotation_degrees.x = look_rot.x
	rotation_degrees.y = look_rot.y
	
	move_dir = Vector3(key_sright - key_sleft, 0, key_sdown - key_sup).normalized().rotated(Vector3.UP, rotation.y)
	velocity.x = float(move_dir.x * movespeed)
	velocity.z = float(move_dir.z * movespeed)
	if not is_on_floor():
		velocity.y -= gravity
	#if is_on_floor():
	#gravity = 0
	if key_run:
		movespeed = lerp(movespeed, 0.25, 0.15)
	if !key_run:
		movespeed = lerp(movespeed, 0.15, 0.15)
	if key_jump2:
		if is_on_floor():
			velocity.y = 0.5
	move_and_slide(velocity * 60, Vector3.UP)
	#move_and_collide(velocity)



## inputs
var key_left = 0
var key_right = 0
var key_up = 0
var key_down = 0
var key_jump = 0
var key_jump2 = 0
var key_run = 0
var key_m1 = 0
var key_m12 = 0
var key_m2 = 0
var key_m22 = 0
var key_sleft = 0
var key_sright = 0
var key_sup = 0
var key_sdown = 0

func get_inputs():
	key_left = Input.is_action_pressed("player_left")
	key_right = Input.is_action_pressed("player_right")
	key_up = Input.is_action_pressed("player_up")
	key_down = Input.is_action_pressed("player_down")
	key_jump = Input.is_action_pressed("player_jump")
	key_jump2 = Input.is_action_just_pressed("player_jump")
	key_run = Input.is_action_pressed("player_run")
	key_m1 = Input.is_action_pressed("player_action1")
	key_m12 = Input.is_action_just_pressed("player_action1")
	key_m2 = Input.is_action_pressed("player_action2")
	key_m22 = Input.is_action_just_pressed("player_action2")
	key_sleft = Input.get_action_strength("player_left")
	key_sright = Input.get_action_strength("player_right")
	key_sup = Input.get_action_strength("player_up")
	key_sdown = Input.get_action_strength("player_down")

	
