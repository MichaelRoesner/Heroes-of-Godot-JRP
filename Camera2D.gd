extends Camera2D

var camera_zoom = Vector2(2,2)

func _ready():
	zoom = camera_zoom
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if zoom > Vector2(2,2):
				zoom -= Vector2(0.1, 0.1) # Zoom in
				print(zoom)
			else:
				return
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if zoom < Vector2(5,5):
				zoom += Vector2(0.1, 0.1) # Zoom out
				print(zoom)
			else:
				return
				

