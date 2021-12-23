extends Area2D


func _on_Water_body_entered(body):
	if body.has_method("entered_water"):
		body.entered_water()
	
	if body.is_in_group("remove_in_water"):
		body.queue_free()
	pass
