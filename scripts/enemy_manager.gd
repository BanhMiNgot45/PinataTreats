extends Node2D

var sprites = ["res://sprites/pinata_one.png", "res://sprites/pinata_two.png", "res://sprites/pinata_three.png", "res://sprites/pinata_four.png"]
var corrupt = ["res://sprites/humanoid_one.png", "res://sprites/humanoid_two.png", "res://sprites/humanoid_three.png", "res://sprites/humanoid_four.png"]
export var health = 10
var rng = RandomNumberGenerator.new()
var fairy
var current

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	fairy = get_parent().get_node("fairy")
	var pos = fairy.global_position
	var pinata = load('res://scenes/pinata.tscn')
	var pinata_instance = pinata.instance()
	pinata_instance.health = self.health
	if get_parent().name == "level_one":
		var p = Vector2(rng.randf_range(-50.0, 750.0), rng.randf_range(-50.0, 400.0))
		while p.x > pos.x - 100 and p.x < pos.x + 100 and p.y > pos.y - 100 and p.y < pos.y + 100:
			p = Vector2(rng.randf_range(-50.0, 750.0), rng.randf_range(-50.0, 400.0))
		pinata_instance.global_position = p
	elif get_parent().name == "level_two":
		var p = Vector2(rng.randf_range(50.0, 700.0), rng.randf_range(50.0, 500.0))
		while p.x > pos.x - 100 and p.x < pos.x + 100 and p.y > pos.y - 100 and p.y < pos.y + 100:
			p = Vector2(rng.randf_range(50.0, 700.0), rng.randf_range(50.0, 500.0))
		pinata_instance.global_position = p
	current = rng.randi_range(0, 3)
	if get_parent().name == "level_one":
		pinata_instance.get_node("Sprite").texture = load(sprites[current])
	elif get_parent().name == "level_two":
		pinata_instance.get_node("Sprite").texture = load(corrupt[current])
	add_child(pinata_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_dead():
	var pos = fairy.global_position
	var pinata = load('res://scenes/pinata.tscn')
	var pinata_instance = pinata.instance()
	pinata_instance.health = self.health
	if get_parent().name == "level_one":
		var p = Vector2(rng.randf_range(-50.0, 750.0), rng.randf_range(-50.0, 400.0))
		while p.x > pos.x - 100 and p.x < pos.x + 100 and p.y > pos.y - 100 and p.y < pos.y + 100:
			p = Vector2(rng.randf_range(-50.0, 750.0), rng.randf_range(-50.0, 400.0))
		pinata_instance.global_position = p
	elif get_parent().name == "level_two":
		var p = Vector2(rng.randf_range(50.0, 700.0), rng.randf_range(50.0, 500.0))
		while p.x > pos.x - 100 and p.x < pos.x + 100 and p.y > pos.y - 100 and p.y < pos.y + 100:
			p = Vector2(rng.randf_range(50.0, 700.0), rng.randf_range(50.0, 500.0))
		pinata_instance.global_position = p
	current = rng.randi_range(0, 3)
	if get_parent().name == "level_one":
		pinata_instance.get_node("Sprite").texture = load(sprites[current])
	elif get_parent().name == "level_two":
		pinata_instance.get_node("Sprite").texture = load(corrupt[current])
	add_child(pinata_instance)
