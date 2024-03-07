extends Node2D

var windowtitle = "Soupers Radical School 3"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var mousesens = 0.2
var player
var superboys = 0
var maxsuperboys = 8
var cullingdistance = 40
# Called when the node enters the scene tree for the first time.
func _ready():

	#get_tree().get_root().set_transparent_background(true)
	pass # Replace with function body.


func _process(delta):
	$CanvasLayer/fps.text = str(Engine.get_frames_per_second())
	pass
