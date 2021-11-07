extends Node2D

onready var fairy = get_parent().get_node("fairy")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fairy.energy >= 10 and get_parent().name == "level_one":
		get_tree().change_scene("res://scenes/level_up.tscn")
	elif fairy.energy >= 15 and get_parent().name == "level_two":
		get_tree().change_scene("res://scenes/corrupted_level_up.tscn")
	elif fairy.energy <= 0 and get_parent().name == "level_three":
		get_tree().change_scene("res://scenes/game_over.tscn")
