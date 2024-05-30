extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var stamina
var running
var anchorY = 5
var frequency = 0.1
var amplitude = 5
var timer = 0
var timery = 0
var shakeamount = 2.5
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("flash")
	pass # Replace with function body.


func _process(delta):
	var textanchory = 257
	var textanchorx = 0
	shakeamount = -shakeamount
	$RichTextLabel.rect_position.y = textanchory + shakeamount
	$RichTextLabel.rect_position.x = textanchorx + shakeamount
	$Node2D/RichTextLabel.bbcode_text = str("[center][shake]", int(stamina), "%")
	if running and stamina < 100:
		$Node2D.position.y = lerp($Node2D.position.y, 218, 0.1)
	if !running and !stamina < 100:
		$Node2D.position.y = lerp($Node2D.position.y, 450, 0.1)
	if running and stamina == 0:
		$RichTextLabel.visible = true
	if running and stamina == 0:
		$RichTextLabel.visible = true
	else:
		$RichTextLabel.visible = false
	$Node2D.position.x = 135 + sin(timer*frequency)*amplitude
	timer += 0.5
	pass
