extends CharacterBody2D

const DIST = 50

func _physics_process(delta):
	position = get_parent().get_local_mouse_position().normalized() * DIST

# func _on_ayo_weapon_location(my_pos:Vector2, direction:Vector2):
# 	look_at(direction)
# 	# pass # Replace with function body.
