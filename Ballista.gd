extends RigidBody

var num = 0

var unit = null
var move_destination = Vector3()
export var speed = 5

#---------pathfidning
var path = []
var path_ind = 0
onready var nav = get_tree().get_root().get_node("Base/Navigation")

func _physics_process(delta):
	
	unit = get_tree().get_root().get_node("Base/Camera/Controls").unit
	move_destination = get_tree().get_root().get_node("Base/Camera/Controls").move_destination
	#if(unit != null && Input.is_action_pressed("middle_mouse")):
		#simple_move(delta)
	

	while(num < path.size()):
		num += 1
		print(num)
	
	if(path_ind < path.size()):
		var move_vec = (path[path_ind] - global_transform.origin)
		#print(path.size())
		if(move_vec.length() < 0.2):
			path_ind += 1
		else:
			unit.apply_impulse(Vector3(0, 0, 0), move_vec.normalized() * speed * delta)

func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_ind = 0




#func simple_move(delta):
	#var dir = Vector3()
	#dir = (move_destination - unit.global_transform.origin).normalized()
	#if(move_destination.distance_to(unit.global_transform.origin) > 3):
	#	unit.apply_impulse(Vector3(0, 0, 0), dir * speed * delta)


