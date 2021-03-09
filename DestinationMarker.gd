extends Area

func _on_Marker_body_entered(body):
	if(body.is_in_group("Unit")):
		print("collision occured")
		queue_free()

