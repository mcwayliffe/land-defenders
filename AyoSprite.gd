extends Sprite2D

var FACING_FORWARD: Vector2i = Vector2i(1, 0)
var FACING_LEFT: Vector2i = Vector2i(1, 1)
var FACING_DOWN: Vector2i = Vector2i(1, 2)
var FACING_RIGHT: Vector2i = Vector2i(1, 3)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var my_pos = Vector2()
	var mouse_pos = get_local_mouse_position()
	var angle = my_pos.angle_to_point(mouse_pos)
	if angle < PI / 4 and angle > - PI / 4:
		frame_coords = FACING_RIGHT
	elif angle > PI / 4 and angle < 3 * PI / 4:
		frame_coords = FACING_DOWN
	elif angle > 3 * PI / 4 or angle < - 3 * PI / 4:
		frame_coords = FACING_LEFT
	else:
		frame_coords = FACING_FORWARD
