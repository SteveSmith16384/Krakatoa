extends RigidBody2D

signal hooked

#var already_hooked = false

func _on_HookArea_body_entered(body):
	if body == self:
		return
		
#	if already_hooked == false:
#		already_hooked = true
	if body.is_in_group("cargo"):
		if body.can_be_hooked:
			emit_signal("hooked", body)
	pass
