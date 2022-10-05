extends TileMap

@export var width := 256
@export var height := 150

var noise := FastNoiseLite.new()

func _ready() -> void:
	randomize()
	noise.seed = randi()
	noise.fractal_octaves = 5
	generate_map()

func generate_map() ->void:
	for x in width:
		for y in height:
			var rand = floor((abs(noise.get_noise_2d(x, y)))*6)+1
			set_cell(0, Vector2i(x, y), rand, Vector2i(0, 0), 0)
			
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("tab"):
		get_tree().reload_current_scene()
