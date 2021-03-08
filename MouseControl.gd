extends Spatial

onready var cam = get_tree().get_root().get_node("Base/Camera")
onready var unit = null

var unit_pos = Vector3()
var target_pos = Vector3()
var dir = Vector3()
var begin_move = false

var fullscreen_toggle = true

func _process(delta):
	toggle_fullscreen(delta)

	var ray_origin = cam.project_ray_origin(get_viewport().get_mouse_position())
	var ray_direction = cam.project_ray_normal(get_viewport().get_mouse_position())
	
	var from = ray_origin
	var to = ray_origin + ray_direction * 1000.0
	var space_state = get_world().get_direct_space_state()
	var hit = space_state.intersect_ray(from, to)
	if(Input.is_action_just_pressed("mouse_left")):
		if hit.size() != 0:
			var selected_unit = hit.collider.name
			print(selected_unit)
			var temp_selection = get_tree().get_root().get_node("Base/" + selected_unit)
			if(temp_selection.get_class() == "RigidBody"):
				unit = get_tree().get_root().get_node("Base/" + selected_unit)
			print(unit)
				
func toggle_fullscreen(delta):
	if(Input.is_action_just_pressed("F")):
		fullscreen_toggle = !fullscreen_toggle
		print(fullscreen_toggle)
		if(fullscreen_toggle == true):
			OS.window_fullscreen = true
		else:
			OS.window_fullscreen = false
