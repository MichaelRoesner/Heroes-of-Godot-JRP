extends Node2D


# Script to loop over the scene tree and print its contents

func _ready():
	getMercenaries()

func getMercenaries():
	for i in range(get_child_count()):
		var child = get_child(i)
		
		print(child.name)
