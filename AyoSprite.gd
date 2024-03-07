extends Sprite2D

var FACING_UP: Vector2i = Vector2i(1, 0)
var FACING_LEFT: Vector2i = Vector2i(1, 1)
var FACING_DOWN: Vector2i = Vector2i(1, 2)
var FACING_RIGHT: Vector2i = Vector2i(1, 3)
# Called when the node enters the scene tree for the first time.
func _ready():
	frame_coords = FACING_UP


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ayo_facing_changed(new_facing:int):
	match new_facing:
		PlayerFacing.FACING_UP:
			frame_coords = FACING_UP
		PlayerFacing.FACING_RIGHT:
			frame_coords = FACING_RIGHT
		PlayerFacing.FACING_LEFT:
			frame_coords = FACING_LEFT
		PlayerFacing.FACING_DOWN:
			frame_coords = FACING_DOWN
