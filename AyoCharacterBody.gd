extends CharacterBody2D

@export var FORWARD_SPEED: float = 150.0
@export var BACKWARD_SPEED: float = 75.0
@export var health: float = 100.0
signal facing_changed(new_facing: int)
signal weapon_location(my_pos: Vector2, direction: Vector2)
const EPSILON = 0.0001

var player_facing: int = PlayerFacing.FACING_UP
var facing_vectors = {
	PlayerFacing.FACING_RIGHT: Vector2(1, 0),
	PlayerFacing.FACING_UP: Vector2(0, 1),
	PlayerFacing.FACING_LEFT: Vector2(-1, 0),
	PlayerFacing.FACING_DOWN: Vector2(0, -1)
}

func determine_player_facing(mouse_pos: Vector2) -> int:
	var facing: int
	var facing_angle: float = mouse_pos.angle()

	if facing_angle < PI / 4 and facing_angle > - PI / 4:
		facing = PlayerFacing.FACING_RIGHT
	elif facing_angle > PI / 4 and facing_angle < 3 * PI / 4:
		facing = PlayerFacing.FACING_DOWN
	elif facing_angle > 3 * PI / 4 or facing_angle < - 3 * PI / 4:
		facing = PlayerFacing.FACING_LEFT
	else:
		facing = PlayerFacing.FACING_UP

	return facing

func determine_velocity(facing: int) -> Vector2:
	var mvmt_x: float = Input.get_axis("left", "right")
	var mvmt_y: float = Input.get_axis("up", "down")
	var mvmt_direction: Vector2 = Vector2(mvmt_x, mvmt_y)

	if facing == PlayerFacing.FACING_RIGHT and mvmt_x < 0:
		return mvmt_direction * BACKWARD_SPEED
	elif facing == PlayerFacing.FACING_LEFT and mvmt_x > 0: 
		return mvmt_direction * BACKWARD_SPEED	
	elif facing == PlayerFacing.FACING_DOWN and mvmt_y < 0:
		return mvmt_direction * BACKWARD_SPEED
	elif facing == PlayerFacing.FACING_UP and mvmt_y > 0:
		return mvmt_direction * BACKWARD_SPEED

	return mvmt_direction * FORWARD_SPEED

func _physics_process(delta):
	var mouse_pos: Vector2 = get_local_mouse_position()

	var new_facing: int = determine_player_facing(mouse_pos)
	if new_facing != player_facing:
		facing_changed.emit(new_facing)
		player_facing = new_facing

	velocity = determine_velocity(player_facing)

	weapon_location.emit(position, get_global_mouse_position())

	var collision = move_and_collide(velocity * delta)

func _on_player_hit():
	health -= 20
	if health <= 0:
		print("Dead")