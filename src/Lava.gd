extends RigidBody2D

func _ready():
#	applied_force = Vector2(-10, -2000)
	pass
	
	


func _on_RemoveArea2D_body_entered(body):
	if body == self:
		return
		
	$RemoveTimer.start()
	pass


func _on_RemoveTimer_timeout():
	self.queue_free()
	pass
