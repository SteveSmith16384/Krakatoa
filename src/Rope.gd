extends Node2D

export var num_segments: int = 4
export var enabled: bool = true
var segments: Array = []
var string_node_scene: PackedScene = load("res://RopeNode.tscn")
var rope_joint_scene: PackedScene = load("res://RopeJoint.tscn")
onready var player_1: Node2D = $"/root/Main/Helicopter"
onready var player_2: RigidBody2D = $"/root/Main/Hook"
onready var start_position: Vector2# = player_1.transform.get_origin()
onready var end_position: Vector2 = player_2.transform.get_origin()
var last_joint

func _ready():
	if not self.enabled:
		return
		
	# we need to generate num_segments segments and num_segments + 1 node
	for i in range(self.num_segments):
		var position: Vector2
		if i == 0:
			position = self.player_1.transform.get_origin()
			position.y += 50
			start_position = position
		elif i == self.num_segments -1:
			position = self.player_2.transform.get_origin()
		else:
			var relative_distance: float = float(i)/float(self.num_segments)
			position = self.start_position + relative_distance * (self.end_position - self.start_position)

		var rope_segment_instance: RigidBody2D = self.string_node_scene.instance()
		attach_instance(rope_segment_instance, i == 0, position)
		
	# rope has been built, attach the players
	segments.push_front(self.player_1)
	segments.push_back(self.player_2)
	self._attach_nodes_at_position(0, 1)
	self._attach_nodes_at_position(-2, -1)


func _attach_nodes_at_position(position_a: int, position_b: int):
	var rope_joint_instance: PinJoint2D = self.rope_joint_scene.instance()
	last_joint = rope_joint_instance
	self.add_child(rope_joint_instance)
	rope_joint_instance.transform.origin = (segments[position_b].transform.origin + segments[position_a].transform.origin) * 0.5
	rope_joint_instance.node_a = segments[position_a].get_path()
	rope_joint_instance.node_b = segments[position_b].get_path()


func attach_instance(rope_segment_instance, is_first, position):
	rope_segment_instance.transform.origin = position
	self.add_child(rope_segment_instance)
	segments.append(rope_segment_instance)
	
	if not is_first:
		# for any segments beyond the first, attach the previous two
		self._attach_nodes_at_position(-2, -1)
	pass
	
	
func attach_cargo(cargo) -> bool:
	var current_cargo = segments.back()
	if current_cargo.is_in_group("cargo"):
		return false
		
	var position = cargo.transform.get_origin()#self.player_2.transform.get_origin()
	position.y += 50
	attach_instance(cargo, false, position)
	return true
	

func detach_cargo() -> bool:
	var current_cargo = segments.back()
	if current_cargo.is_in_group("cargo") == false:
		return false
		
	self.remove_child(last_joint)
	last_joint.queue_free()
	last_joint = null
	segments.pop_back()
	return true
	
	
func _process(_delta):
	# trigger redraw
	self.update()


func _draw():
	for i in range(len(self.segments) - 1):
		draw_line(
			self.segments[i].transform.origin,
			self.segments[i+1].transform.origin,
			Color(0/255.0, 0/255.0, 0/255.0),
			8
		)
		draw_line(
			self.segments[i].transform.origin,
			self.segments[i+1].transform.origin,
			Color(200/255.0, 200/255.0, 200/255.0),
			4
		)
