extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.set_wait_time(5)
	timer.set_one_shot(true)
	self.add_child(timer)
	timer.start()
	yield(timer, "timeout")
	get_tree().change_scene("res://scenes/level_three.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
