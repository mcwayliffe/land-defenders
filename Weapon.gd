extends CharacterBody2D

@export var DIST: int = 30
var is_attacking: bool = false
var attack_timer: SceneTreeTimer

func _draw():
	if is_attacking:
		draw_circle(position, 10, "#ffffff")

func _input(event):
	if event is InputEventMouseButton:
		is_attacking = true
		attack_timer = get_tree().create_timer(1.0)
		queue_redraw()

func _physics_process(delta):
	position = get_parent().get_local_mouse_position().normalized() * DIST

# func _on_ayo_weapon_location(my_pos:Vector2, direction:Vector2):
# 	look_at(direction)
# 	# pass # Replace with function body.
