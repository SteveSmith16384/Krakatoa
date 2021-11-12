extends Node2D


func _ready():
	$CanvasLayer/Version.text = "VERSION:" + str(Globals.VERSION)
	pass
	
	
func _process(delta):
	$Dockyard.rotate(delta)
	$Crane.rotate(-delta)
	pass
	

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode != KEY_ESCAPE:
			get_tree().change_scene("res://Main.tscn")
		else:
			get_tree().quit()
	pass
	


func _on_Timer_timeout():
	$CanvasLayer/CenterContainer/VBoxContainer.visible = not $CanvasLayer/CenterContainer/VBoxContainer.visible
	pass # Replace with function body.
