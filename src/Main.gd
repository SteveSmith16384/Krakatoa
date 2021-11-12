extends Node2D

const speed = 120

var thrust = 250#Vector2(0, -250)
var torque = 20000

var game_over = false


func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://godot_rope/IntroScene.tscn")
		return
	pass
	

func _physics_process(delta):
	if game_over:
		return
			
	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += .1
	elif Input.is_action_pressed("ui_left"):
		rotation_dir -= .1
		$Helicopter.applied_torque = rotation_dir * torque
		#$Helicopter.apply_torque_impulse = rotation_dir * torque
	self
	
	if Input.is_action_pressed("ui_up"):
		var th: Vector2 = $Helicopter/Up.position
		th = Vector2(th.normalized()) * thrust# * -1
		$Helicopter.applied_force = th#thrust.rotated($Helicopter.rotation)
	else:
		$Helicopter.applied_force = Vector2()
		
	if Input.is_action_just_pressed("detach_hook"):
		if $Rope.detach_cargo():
			$AudioStreamPlayer_Detach.play()
	pass


