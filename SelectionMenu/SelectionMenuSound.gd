extends AudioStreamPlayer



func _ready():
	play_selection_menu_audio() #replace with just play()
	print("ready")


func play_selection_menu_audio():
	var current_scene = get_tree().current_scene
	print("current scene is: ", current_scene)
	if current_scene.name == "SelectionMenu":

		var audio_player = current_scene.find_child("AudioStreamPlayer", true, false)
		if audio_player:
			audio_player.play(0.0)
			print("is playing:", audio_player.is_playing())
		else:
			print("AudioStreamPlayer2D node not found in SelectionMenu scene.")
	else:
		print("Current scene is not SelectionMenu.")


func _on_button_pressed():
	print("pressing button")
	var audio_player = $"."
	if audio_player.is_playing():
		audio_player.stop()
		print("stop")
	else:
		audio_player.play()
		print("start")
		
		#Persistence.config.set_value("Video", "fullscreen", DisplayServer.WINDOW_MODE_WINDOWED)
		#Persistence.save_data()
		
