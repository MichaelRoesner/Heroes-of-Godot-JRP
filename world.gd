extends Node2D

@onready var items = $Items
@onready var item_spawn_area = $ItemSpawnArea
@onready var collision_shape = $ItemSpawnArea/CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_random_items(10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func get_random_position():
	var area_rect = collision_shape.shape.get_rect()
	var x = randf_range(0, area_rect.position.x)
	var y = randf_range(0, area_rect.position.y)
	return item_spawn_area.to_global(Vector2(x,y))
	
func spawn_random_items(count):
	var attempts = 0
	var spawned_count = 0
	while spawned_count < count and attempts < 100:
		var position = get_random_position()
		spawn_item(Global.spawnable_items[randi() % Global.spawnable_items.size()], position)
		spawned_count += 1
		attempts += 1
		
		
		
func spawn_item(data, position):
	var item_scene = preload("res://itemsMercs/inventory_item.tscn")
	var item_instance = item_scene.instantiate()
	item_instance.initiate_item(data["type"], data["name"], data["effect"], data["texture"])
	item_instance.global_position = position
	items.add_child(item_instance)
