extends Area2D

func _on_Pickup_body_entered(body):
	if body.is_in_group("player"):
		$AnimationPlayer.play("pickup")
		get_tree().call_group("cake", "add_cake")
