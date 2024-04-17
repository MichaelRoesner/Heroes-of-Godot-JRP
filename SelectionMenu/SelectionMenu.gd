extends Node2D

@onready var main_menu = load("res://MainMenu/MainMenu.tscn")
#@onready var main_menu_ui = %UI

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _input(event):
	if event is InputEventKey:
		if event.pressed and event.is_action_pressed("ui_cancel"):
			# Execute when the Escape key is pressed
			print(get_tree().current_scene)
			get_tree().change_scene_to_packed(main_menu)

		


				
