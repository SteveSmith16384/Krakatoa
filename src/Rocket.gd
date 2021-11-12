extends RigidBody2D

func _ready():
	$AudioStreamPlayer.play()
	pass
	
	
func _physics_process(delta):
	#self.apply_central_impulse(Vector2(-100, 0))
	#self.apply_central_impulse(Vector2(-1, 0))
	self.apply_central_impulse($Position2D.position.normalized() * 10)
	pass


func _on_RemoveTimer_timeout():
	self.queue_free()
	pass # Replace with function body.
