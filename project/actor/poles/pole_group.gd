extends Node2D

signal completed

onready var chime = $AudioStreamPlayer

var active_childeren := 0

func _ready():
	for child in get_children():
		if child.has_signal("toggled"): child.connect("toggled", self, "toggled")
		if child.has_node("Timer"): child.get_node("Timer").wait_time = get_child_count()
		
func toggled(active : bool):
	active_childeren += 1 if active else -1
	if active:
		chime.pitch_scale = pow(2, (active_childeren) / 12.0) # Set note
		chime.play()
	
	if active_childeren == get_child_count() - 2: #Audio
		emit_signal("completed")


func _on_PoleGroup_completed():
	$Complete.play()
	for child in get_children():
		if child.has_node("Timer"): child.get_node("Timer").stop()
