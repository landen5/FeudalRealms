extends Spatial

onready var cam = get_tree().get_root().get_node("Spatial/Camera")
onready var tank = get_tree().get_root().get_node("Spatial/Ballista")

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
	if hit.size() != 0:
		print(hit.collider.name)
		if(hit.collider.name == "Ballista"):
			if(Input.is_action_pressed("mouse_left")):
				unit_pos = tank.global_transform.origin
				#print(unit_pos)
	#if(Input.is_action_pressed("mouse_right")):
		#if(hit.size() != 0):
			#target_pos = hit.position
			#print(hit.position)
			#begin_move = true
	
	#while(unit_pos.distance_to(target_pos) >= 5):
		#tank.apply_impulse(dir, unit_pos)
		
func toggle_fullscreen(delta):
	if(Input.is_action_just_pressed("F")):
		fullscreen_toggle = !fullscreen_toggle
		print(fullscreen_toggle)
		if(fullscreen_toggle == true):
			OS.window_fullscreen = true
		else:
			OS.window_fullscreen = false
