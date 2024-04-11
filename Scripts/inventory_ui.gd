extends Control

@onready var grid_container = $GridContainer

#Drag/Drop
var dragged_slot = null

##############################
## Assuming a 3x3 grid for simplicity
#const GRID_WIDTH = 3
#const GRID_HEIGHT = 3
#
## New variable to keep track of selected slots
#var selected_slots = []
##############################

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.inventory_updated.connect(_on_inventory_updated)
	_on_inventory_updated()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_inventory_updated():
	clear_grid_container()
	for item in Global.inventory:
		var slot = Global.inventory_slot_scene.instantiate()
		
		slot.drag_start.connect(_on_drag_start)
		slot.drag_end.connect(_on_drag_end)
		
		grid_container.add_child(slot)
		if item != null:
			slot.set_item(item)
		else:
			slot.set_empty()

func clear_grid_container():
	while grid_container.get_child_count() > 0:
		var child = grid_container.get_child(0)
		grid_container.remove_child(child)
		child.queue_free()

#Store dragdata
func _on_drag_start(slot_control : Control):
	dragged_slot = slot_control
	print("Slot selected: ", get_slot_index(dragged_slot))
	print("Drag started: ", dragged_slot)

func _on_drag_end():
	var target_slot = get_slot_under_mouse()
	if target_slot and dragged_slot != target_slot:
		drop_slot(dragged_slot, target_slot)
	dragged_slot = null

func get_slot_under_mouse() -> Control:
	var mouse_position = get_global_mouse_position()
	for slot in grid_container.get_children():
		var slot_rect = Rect2(slot.global_position, slot.size)
		if slot_rect.has_point(mouse_position):
			return slot

	return null
		
func get_slot_index(slot: Control) -> int:
	for i in range(grid_container.get_child_count()):
		if grid_container.get_child(i) == slot:
			return i
	return -1
	
# Drop slots
func drop_slot(slot1: Control, slot2: Control):
	var slot1_index = get_slot_index(slot1)
	var slot2_index = get_slot_index(slot2)
	if slot1_index == -1 or slot2_index == -1:
		return  
	else:
		if Global.swap_inventory_items(slot1_index, slot2_index):
			_on_inventory_updated()
			print("Dropping slot: ", slot1_index, " to ", slot2_index)
			
#func _on_slot_clicked(slot_control: Control):
	## Determine the slot index
	#var index = get_slot_index(slot_control)
	#
	## Clear previous selections for simplicity, or implement toggle logic
	#selected_slots.clear()
	#deselect_all_slots()  # This would visually update slots to show they are not selected
	#
	## Select the clicked slot and its neighbors
	#select_slot_and_neighbors(index)
#
#func select_slot_and_neighbors(index: int):
	## Calculate row and column of the clicked slot
	#var row = index / GRID_WIDTH
	#var col = index % GRID_WIDTH
	#
	## Determine the indexes of neighbors
	#var neighbors = [
		#index,  # The clicked slot itself
		#index - 1 if col > 0 else -1,  # Left
		#index + 1 if col < GRID_WIDTH - 1 else -1,  # Right
		#index - GRID_WIDTH if row > 0 else -1,  # Above
		#index + GRID_WIDTH if row < GRID_HEIGHT - 1 else -1,  # Below
	#]
	#
	## Update selection state and visuals
	#for neighbor_index in neighbors:
		#if neighbor_index != -1 and grid_container.get_child(neighbor_index) != null:
			#selected_slots.append(neighbor_index)
			#grid_container.get_child(neighbor_index).select()  # You'll need to implement the select method
#
#func deselect_all_slots():
	#for slot in grid_container.get_children():
		#slot.deselect()  # Implement this method to visually update the slot
