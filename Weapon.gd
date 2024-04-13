extends CharacterBody2D

@export var DIST: int = 30
var hurtBox
var hurtBoxInstance: Node2D
signal attack_finished

func _ready():
	hurtBox = preload("res://hurt_box.tscn")

func _input(event):
	if event is InputEventMouseButton:
		do_attack()

func _physics_process(_delta):
	position = get_parent().get_local_mouse_position().normalized() * DIST

func do_attack():
	hurtBoxInstance = hurtBox.instantiate()
	add_child(hurtBoxInstance)
	$Timer.start()

func _on_timer_timeout():
	if hurtBoxInstance:
		remove_child(hurtBoxInstance)
		hurtBoxInstance.queue_free()