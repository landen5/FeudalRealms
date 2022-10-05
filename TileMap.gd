extends TileMap

@export var width := 400
@export var height := 200

var noise := FastNoiseLite.new()

var water_level = 0.05
var sand_level = 0.1
var light_grass_level = 0.3
var grass_level = 0.5
var dark_grass_level = 0.6
var stone_level = 0.7
var snow_level = 0.8


func _ready() -> void:
	randomize()
	noise.seed = randi()
	
	#ridges
	noise.fractal_octaves = 5
	noise.fractal_lacunarity = 2

	
	noise.frequency = .007
	generate_map()

func generate_map() ->void:
	for x in width:
		for y in height:
			#var rand = floor((abs(noise.get_noise_2d(x, y)))*6)
			var rand = abs(noise.get_noise_2d(x, y))
			var material;
			if(rand <= water_level):
				material = 0
			if(rand > water_level && rand <= sand_level):
				material = 1
			if(rand > sand_level && rand <= light_grass_level):
				material = 2
			if(rand > light_grass_level && rand <= grass_level):
				material = 3
			if(rand > grass_level && rand <= dark_grass_level):
				material = 4
			if(rand > dark_grass_level && rand <= stone_level):
				material = 5
			if(rand > stone_level && rand <= snow_level):
				material = 6
			
			set_cell(0, Vector2i(x, y), material, Vector2i(0, 0), 0)
			
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("tab"):
		get_tree().reload_current_scene()
#
