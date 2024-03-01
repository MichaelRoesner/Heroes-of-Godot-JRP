extends Node2D

var inventory = preload("res://inventory.tscn").instantiate()
var coords 



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var local_mouse_pos = get_local_mouse_position()
	print("Local Mouse Position: ", local_mouse_pos)
