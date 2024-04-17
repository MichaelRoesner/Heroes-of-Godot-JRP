@tool
extends Node2D

@export var merc_type = ""
@export var merc_name = ""
@export var merc_texture : Texture
@export var merc_effect = ""

var scene_path : String = "res://Mercenary/Mercenaries/mercenary_unit.tscn"

@onready var icon_sprite = $AnimatedSprite2D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		icon_sprite.texture = merc_texture
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Engine.is_editor_hint():
		icon_sprite.texture = merc_texture
		
	if player_in_range and Input.is_action_just_pressed("ui_add"):
		pickup_merc()

func pickup_merc():
	var merc = {
		"quantity" : 1,
		"type" : merc_type,
		"name" : merc_name,
		"effect" : merc_effect,
		"texture" : merc_texture,
		"scene_path" : scene_path
	}
	if Global.player_node:
		Global.add_merc(merc, false)
		self.queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		player_in_range = true
		body.interact_ui.visible = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		player_in_range = false
		body.interact_ui.visible = false

func set_merc_data(data):
	merc_type = data["type"]
	merc_name = data["name"]
	merc_effect = data["effect"]
	merc_texture = data["texture"]
	

func initiate_merc(type, name, effect, texture):
	merc_type = type
	merc_name = name
	merc_effect = effect
	merc_texture = texture
