extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Water_body_entered(body):
	if body.has_method("entered_water"):
		body.entered_water()
	
	if body.is_in_group("remove_in_water"):
		body.queue_free()
	pass
