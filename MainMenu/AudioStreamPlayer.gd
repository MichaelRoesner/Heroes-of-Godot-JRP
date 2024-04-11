extends AudioStreamPlayer


func _ready():
	play_main_menu_audio() #replace with just play()


func play_main_menu_audio():
	var current_scene = get_tree().current_scene
	print(current_scene)
	if current_scene.name == "MainMenu":

		var audio_player = current_scene.find_child("AudioStreamPlayer", true, false)
		if audio_player:
			audio_player.play(0.0)
			print("is playing:", audio_player.is_playing())
		else:
			print("AudioStreamPlayer2D node not found in MainMenu scene.")
	else:
		print("Current scene is not MainMenu.")
