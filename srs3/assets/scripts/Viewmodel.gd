extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ogposition = position
var anchorY = 5
var frequency = 0.2
var amplitude = 25
var timer = 0
var timery = 0
var moving = false
var running = false
var canrun = false

onready var y = position.y
onready var x = position.y
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if moving:
		position.x = ogposition.x + sin(timer*0.1)*35
		position.y = ogposition.y + sin(timery*frequency)*amplitude
		if !running or !canrun:
			timer += 0.5
			timery += 0.6
		if running and canrun:
			timer += 0.8
			timery += 0.9
	if !moving:
		position = lerp(position, ogposition, 0.2)
		timer = 0
		timery = 0
	pass
