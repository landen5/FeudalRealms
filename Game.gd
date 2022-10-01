extends Node2D

var simSpeed : int
# Called when the node enters the scene tree for the first time.
func _ready():
	simSpeed = 60
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.get_process_frames() % simSpeed == 0:
		$SettlementManager.update_settlements()
		print(simSpeed)

func _on_gui_slow_down():
	if simSpeed <= 90:
		simSpeed += 10


func _on_gui_speed_up():
	if simSpeed >= 30:
		simSpeed -= 10
