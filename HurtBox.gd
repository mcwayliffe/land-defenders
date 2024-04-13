extends Node2D

func _ready():
	connect("../attack_finished", _on_attack_finished)

func _on_attack_finished():
	print("Finished")
	for child in get_children():
		remove_child(child)
		child.queue_free()
	queue_free()
