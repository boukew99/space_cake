extends Label

func _unhandled_input(event):
		
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused
		visible = not visible