extends RigidBody2D

var can_be_hooked = true # Cannot be hooked once inside cargo bay
var added = false # Has it been counted


func _ready():
	var main = get_tree().get_root().get_node("Main")
	
	var sprite_num = (main.level-1) % 9
	var sprite: Sprite = self.get_node("Sprites/Sprite_" + str(sprite_num))
	sprite.visible = true
	
	var vec = Vector2(sprite.texture.get_width()* sprite.scale.x / 2, sprite.texture.get_height()* sprite.scale.y / 2)
	var rect: RectangleShape2D = $CollisionShape2D.shape
	rect.set_extents(vec)

	var rect_crash: RectangleShape2D = $CrashArea2D/CollisionShape2D.shape
	vec.x += 4
	vec.y += 4
	rect_crash.set_extents(vec)
	pass
	

func _on_RemoveTimer_timeout():
	self.remove_from_group("cargo") # So the number of cargo isn't affected
	self.queue_free()
	pass


func _on_CrashArea2D_body_entered(body):
	if body == self:
		return
		
	if body.is_in_group("ships"):
		return
		
	$AudioStreamPlayer_Crash.play()
	pass
