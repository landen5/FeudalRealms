extends Spatial


func _fixed_process(delta):
	print("test")
	var cam = get_parent().get_node("Camera")
	
	var ray_origin = cam.project_ray_origin(get_viewport().get_mouse_position())
	var ray_direction = cam.project_ray_normal(get_viewport().get_mouse_position())
	
	var from = ray_origin
	var to = ray_origin + ray_direction * 1000.0
	var space_state = get_world().get_direct_space_state()
	var hit = space_state.intersect_ray(from, to)
	print(ray_origin)
	if hit.size() != 0:
		print(hit.collider)
