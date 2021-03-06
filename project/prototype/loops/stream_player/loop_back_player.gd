extends AudioStreamPlayer

export(Array, AudioStreamOGGVorbis) var loop_sequence
export var current_loop := 0
export var auto_next = false

func _on_LoopBackPlayer_finished():
	if auto_next: next()
	stream = loop_sequence[current_loop]
	play()

func next():
	current_loop = clamp(current_loop + 1, 0, loop_sequence.size() - 1)
