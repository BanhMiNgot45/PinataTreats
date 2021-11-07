extends Node2D

var time = 0.0
var bullet
export var speed = 1
export var interval = 2.5
var v_x = [0, 1, 1, 1, 0, -1, -1, -1]
var v_y = [1, 1, 0, -1, -1, -1, 0, 1]


# Called when the node enters the scene tree for the first time.
func _ready():
	bullet = load("res://scenes/bullet.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if (time / interval >= 1):
		time = 0.0
		for n in 8:
			var bullet_instance = bullet.instance()
			bullet_instance.position = global_position
			bullet_instance.velocity = Vector2(v_x[n], v_y[n]) * speed
			get_parent().get_parent().get_parent().add_child(bullet_instance)
