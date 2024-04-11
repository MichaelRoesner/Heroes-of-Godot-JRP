extends TileMap


var GridSize = 3
var Dic = {}



func _ready():
	populate_PlayerGroup()
	populate_EnemyGroup()
	#print(Dic)

func populate_PlayerGroup():
	for x in GridSize:
		for y in GridSize:
			Dic[(str(Vector2(x,y)))] = {
				"Type": "Ground",
				"Position:": str(Vector2(x,y))
			}
			set_cell(0, Vector2(x,y),0, Vector2i(0,0),0)
			
func populate_EnemyGroup():
	for x in GridSize:
		for y in GridSize:
			Dic[(str(Vector2(x,y)))] = {
				"Type": "Ground",
				"Position:": str(Vector2(x,y))
			}
			set_cell(0, Vector2(x+4,y),0, Vector2i(0,0),0)

func _process(_delta):
	var tile = local_to_map(get_global_mouse_position())
	for x in GridSize:
		for y in GridSize:
			erase_cell(1, Vector2(x,y))
	
	if Dic.has(str(tile)):
		set_cell(1, tile, 1, Vector2i(0,0),0)
		print(Dic[str(tile)])

