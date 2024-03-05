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
onready var headogpos = $head.translation
var moving = false
var jumping = false
var canjump = true
var canmove = true
var grounded = true
var running = false
var stamina = 100
var canrun = true
var mouse = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseMotion:
		look_rot.y -= (event.relative.x * global.mousesens)
		look_rot.x -= (event.relative.y * global.mousesens)
		look_rot.x = clamp(look_rot.x, minangle, maxangle)
		mouse = event.position

func _process(delta):
	get_inputs()
	pass


func _physics_process(delta):
	global.player = self
	$HUD/crosshair.visible = $head/InteractRay.clickable
	$HUD/sprint.stamina = stamina
	$HUD/Viewmodel.moving = moving
	$HUD/Viewmodel.canrun = canrun
	$HUD/Viewmodel.running = running
	$HUD/sprint.running = running
	grounded = is_on_floor()
	head.rotation_degrees.x = look_rot.x
	rotation_degrees.y = look_rot.y
	camerabobbing()
	move_dir = Vector3(key_sright - key_sleft, 0, key_sdown - key_sup).normalized().rotated(Vector3.UP, rotation.y)
	if stamina > 0:
		canrun = true
	if stamina < 0.1:
		canrun = false
	if canmove:
		velocity.x = float(move_dir.x * movespeed)
		velocity.z = float(move_dir.z * movespeed)
	if not is_on_floor():
		velocity.y -= gravity
		if grounded:
			velocity.y = 0
	if is_on_floor():
		if jumping == true:
			$step.play()
			jumping = false
			velocity.y = 0
	#if is_on_floor():
	#gravity = 0
	if key_run:
		running = true
		if stamina > 0:
			movespeed = lerp(movespeed, 0.35, 0.1)
		if stamina < 0.1:
			movespeed = lerp(movespeed, 0.15, 0.1)
	if !key_run:
		running = false
		if stamina != 0:
			movespeed = lerp(movespeed, 0.15, 0.1)
		if stamina == 0:
			movespeed = lerp(movespeed, 0.05, 0.1)
	if running:
		if stamina > 0:
			if moving:
				stamina -= 0.55
	if !running:
		if stamina < 100:
			if moving:
				stamina += 0.02
			if !moving:
				stamina += 0.1
	if key_jump2:
		if canjump:
			if is_on_floor():
					$jump.play()
					velocity.y = 0.35
					jumping = true
	moving = move_dir.x != 0 and move_dir.z != 0
	move_and_slide(velocity * 60, Vector3.UP)
	if stamina < 0:
		stamina = 0
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
	
var anchorY = 5
var frequency = 0.1
var amplitude = 0.2
var timer = 0

func camerabobbing():
	if moving:
		head.translation.y = headogpos.y + sin(timer*frequency)*amplitude
		if !running or !canrun:
			timer += 2
		if running and canrun:
			timer += 3
	if !moving:
		head.translation.y = lerp(head.translation.y, headogpos.y, 0.2)
	

	


