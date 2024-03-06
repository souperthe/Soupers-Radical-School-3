extends Control



func _process(delta):
	$RichTextLabel.bbcode_text = str("[center][wave amp=50.0 freq=5.0 connected=1]", global.superboys, "/", global.maxsuperboys, "[/wave]")
