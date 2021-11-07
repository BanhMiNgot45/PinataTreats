extends Node2D

var bat
export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	bat = load("res://scenes/bat.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			var bat_instance = bat.instance()
			var target = get_global_mouse_position()
			bat_instance.velocity = -(global_position - target).normalized() * speed
			add_child(bat_instance)
