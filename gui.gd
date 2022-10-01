extends CanvasLayer

signal speedUp
signal slowDown

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_increase_pressed():
	emit_signal("speedUp")


func _on_decrease_pressed():
	emit_signal("slowDown")
