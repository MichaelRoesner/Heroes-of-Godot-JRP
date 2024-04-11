extends Node2D

@export var stats : Merc

# Called when the node enters the scene tree for the first time.
func _ready():
	print(stats.health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
