extends CharacterBody2D

@export var SPEED = 150.0
signal facing_changed(new_facing: int)

var player_facing: int = PlayerFacing.FACING_UP

func determine_player_facing() -> int:
	var facing: int
	var facing_angle: float = get_local_mouse_position().angle()

	if facing_angle < PI / 4 and facing_angle > - PI / 4:
		facing = PlayerFacing.FACING_RIGHT
	elif facing_angle > PI / 4 and facing_angle < 3 * PI / 4:
		facing = PlayerFacing.FACING_DOWN
	elif facing_angle > 3 * PI / 4 or facing_angle < - 3 * PI / 4:
		facing = PlayerFacing.FACING_LEFT
	else:
		facing = PlayerFacing.FACING_UP

	return facing

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
	var new_facing: int = determine_player_facing()
	if new_facing != player_facing:
		facing_changed.emit(new_facing)
		player_facing = new_facing
	get_input()
	move_and_slide()
