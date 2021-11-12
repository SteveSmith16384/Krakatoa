extends Sprite

export var SPEED = 40
var dir = -1

func _process(delta):
	self.position.x += SPEED * delta * dir
	if self.position.x <= 50:
		self.flip_h = true
		dir = 1
	elif self.position.x > 1000:
		self.flip_h = false
		dir = -1
	pass
