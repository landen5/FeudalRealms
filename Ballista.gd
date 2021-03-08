extends RigidBody

func _physics_process(delta):
	var unit = get_tree().get_root().get_node("Base/Camera/Controls").unit
	if(Input.is_action_pressed("Forward")):
		unit.apply_impulse(Vector3(0, 0, 0), Vector3.FORWARD * 5 * delta)
	if(Input.is_action_pressed("Back")):
		unit.apply_impulse(Vector3(0, 0, 0), Vector3.BACK * 5 * delta)
