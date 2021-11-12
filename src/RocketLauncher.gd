extends Position2D

var rocket_class = preload("res://godot_rope/Rocket.tscn")


func _on_Timer_timeout():
	var rocket = rocket_class.instance()
	rocket.position.x = self.position.x
	rocket.position.y = self.position.y - Globals.rnd.randi_range(0, 300)
	

	var main = get_tree().get_root().get_node("Main")
	main.add_child(rocket)
	pass
