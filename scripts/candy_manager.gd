extends Node2D

var sprites = ["res://sprites/candy_cane.png", "res://sprites/candy_one.png", "res://sprites/candy_two.png", "res://sprites/lollipops.png", "res://sprites/candy_corn.png"]
var candy
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	candy = load("res://scenes/candy.tscn")
	rng.randomize()
	
func _on_popped(pos):
	var candy_instance = candy.instance()
	candy_instance.position = pos
	candy_instance.get_node("Sprite").texture = load(sprites[rng.randi_range(0, 4)])
	add_child(candy_instance)
