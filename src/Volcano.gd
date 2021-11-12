extends StaticBody2D

const lava_class = preload("res://Lava.tscn")

func _ready():
	pass # Replace with function body.




func _on_LaunchLavaTimer_timeout():
	var lava = lava_class.instance()
	lava.position = $LavaLaunchPoint.global_position
	
	var main = get_tree().get_root().get_node("Main")
	main.add_child(lava)
	
	#lava.applied_torque = 20000
	lava.apply_torque_impulse(20000
	)
	var x = Globals.rnd.randi_range(-150, 150);
	lava.apply_central_impulse(Vector2(x, -250))
	pass
