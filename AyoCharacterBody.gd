extends CharacterBody2D

@export var SPEED = 150.0

func get_input():
	var forward: Vector2 = get_local_mouse_position().normalized()
	var left: Vector2 = forward.orthogonal()
	var backward: Vector2 = left.orthogonal()
	var right: Vector2 = backward.orthogonal()
	var mvmt_y: float = Input.get_axis("up", "down")
	var mvmt_x: float = Input.get_axis("left", "right")

	var direction: Vector2 = Vector2()
	if mvmt_y > 0: #DOWN
		direction = backward
	elif mvmt_y < 0: #UP
		direction = forward

	if mvmt_x > 0: #RIGHT
		direction += right
	elif mvmt_x < 0: #LEFT
		direction += left

	velocity = direction * SPEED

func _physics_process(delta):
	get_input()
	move_and_slide()
