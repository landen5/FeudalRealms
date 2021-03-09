extends RigidBody

onready var nav = get_tree().get_root().get_node("Base/Navigation")

var unit = null
var move_destination = Vector3()
export var speed = 5

func _physics_process(delta):
	
	unit = get_tree().get_root().get_node("Base/Camera/Controls").unit
	move_destination = get_tree().get_root().get_node("Base/Camera/Controls").move_destination
	
	if(unit != null && Input.is_action_pressed("middle_mouse")):
		simple_move(delta)
	
	if(Input.is_action_pressed("Forward")):
		unit.apply_impulse(Vector3(0, 0, 0), Vector3.FORWARD * speed * delta)
	if(Input.is_action_pressed("Back")):
		unit.apply_impulse(Vector3(0, 0, 0), Vector3.BACK * speed * delta)

func simple_move(delta):
	var dir = Vector3()
	dir = (move_destination - unit.global_transform.origin).normalized()
	if(move_destination.distance_to(unit.global_transform.origin) > 3):
		unit.apply_impulse(Vector3(0, 0, 0), dir * 10 * delta)

