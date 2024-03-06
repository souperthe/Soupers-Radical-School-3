extends StaticBody

var anchorY = 5
var frequency = 0.1
var amplitude = 0.2
var timer = 0

func _process(delta):
	$Sprite3D.translation.y = 0 + sin(timer*frequency)*amplitude
	timer += 0.5
