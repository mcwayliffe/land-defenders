extends Sprite2D

var FACING_UP = Rect2(18, 777, 28, 53)
var FACING_LEFT = Rect2(22, 586, 25, 52)
var FACING_DOWN = Rect2(18, 648, 28, 54)
var FACING_RIGHT = Rect2(18, 714, 25, 52)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var my_pos = Vector2()
	var mouse_pos = get_local_mouse_position()
	var angle = my_pos.angle_to_point(mouse_pos)
	if angle < PI / 4 and angle > - PI / 4:
		region_rect = FACING_RIGHT
	elif angle > PI / 4 and angle < 3 * PI / 4:
		region_rect = FACING_DOWN
	elif angle > 3 * PI / 4 or angle < - 3 * PI / 4:
		region_rect = FACING_LEFT
	else:
		region_rect = FACING_UP
