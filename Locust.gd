extends CharacterBody2D

signal player_hit

@export var SPEED = 60
@export var health: float = 20

func _physics_process(delta):
	var player_node: Node = get_node("../Ayo")
	var player_pos: Vector2 = player_node.position
	velocity = SPEED * position.direction_to(player_pos)
	var collision = move_and_collide(velocity * delta)
	if collision:
		player_hit.emit()
		var prev_dir = collision.get_travel()
		var new_dir = prev_dir.rotated(PI)
		position = position + new_dir * 120

	look_at(player_pos)