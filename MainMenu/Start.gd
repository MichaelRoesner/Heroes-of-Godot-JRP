extends Button

var world_scene = load("res://world.tscn")
@onready var main_menu = %UI


func _on_pressed():
	main_menu.hide() # hides main menu
	#main_menu.queue_free() #removes maimenu
	#get_tree().get_root().call_deferred("remove_child", get_tree().get_root().get_child(0))
	var instance = world_scene.instantiate()
	get_tree().get_root().add_child(instance)
	get_tree().set_current_scene(instance)
	print(get_tree().current_scene)
	print()
	#else:
		#print("Failed to load scene: " + scene_path)
		#
	#main_menu.hide()


