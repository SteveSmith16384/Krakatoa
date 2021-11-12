extends Node

const VERSION = "1.1"
const RELEASE_MODE = true

var rnd : RandomNumberGenerator

func _ready():
	rnd = RandomNumberGenerator.new()
	rnd.randomize()
	pass
	
	
