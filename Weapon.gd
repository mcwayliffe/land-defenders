extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _draw():
	draw_circle(position, 10.0, Color("73C2FB"))

func _physics_process(delta):
	pass

func _on_ayo_weapon_location(my_pos:Vector2, direction:Vector2):
	print(my_pos)
	position = my_pos.move_toward(direction, 10.0)
	print(position)
	queue_redraw()
	# pass # Replace with function body.
