extends Button

var selection_scene = load("res://SelectionMenu/SelectionMenu.tscn")
#@onready var main_menu_audio = $"../../Music/AudioStreamPlayer"
@onready var main_menu_ui = %UI


func _on_pressed():
	#main_menu_audio.stop()
	main_menu_ui.hide()
	print("hiding ui")
	switchScene()


#func switchScene(): #swith to file
	#get_tree().change_scene_to_file("res://SelectionMenu/SelectionMenu.tscn")
	
func switchScene():
	get_tree().change_scene_to_packed(selection_scene)
	


