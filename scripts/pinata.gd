extends Area2D

signal dead
signal popped(pos)

export var health_max = 10
var health = health_max
onready var label = get_node("RichTextLabel")
onready var fairy = get_parent().get_parent().get_node("fairy")
onready var manager = get_parent()
var corrupt = ["res://sprites/humanoid_one.png", "res://sprites/humanoid_two.png", "res://sprites/humanoid_three.png", "res://sprites/humanoid_four.png"]
var human = ["res://sprites/human_one.png", "res://sprites/human_two.png", "res://sprites/human_three.png", "res://sprites/human_four.png"]
var ran = false
var flag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var pinata_manager = get_parent()
	var candy = get_parent().get_parent().get_node("candy_manager")
	connect("dead", pinata_manager, "_on_dead")
	connect("popped", candy, "_on_popped")
	label.text = "Health: " + str(health_max)

func _process(delta):
	label.text = "Health: " + str(health)
	if fairy.energy >= 7 and get_parent().get_parent().name == "level_one" and not flag:
		flag = true
		$Sprite.texture = load(corrupt[manager.current])
	elif fairy.energy >= 12 and get_parent().get_parent().name == "level_two" and not flag:
		flag = true
		$Sprite.texture = load(human[manager.current])
		$Sprite.scale = Vector2(1.05, 1.05)
	if health <= 0 and not ran:
		ran = true
		if fairy.energy >= 5 and fairy.energy < 7 and get_parent().get_parent().name == "level_one":
			if fairy.energy >= 6:
				manager.get_parent().get_node("bg").texture = load("res://sprites/bg_3.png")
			get_parent().get_parent().get_node("glitch").show()
			AudioServer.add_bus_effect(AudioServer.get_bus_index("Master"), AudioEffectDistortion.new(), 0)
			var effect = AudioServer.get_bus_effect(AudioServer.get_bus_index("Master"), 0)
			effect.mode = 4
			effect.drive = 1.0
			var timer = Timer.new()
			timer.set_wait_time(1)
			timer.set_one_shot(true)
			self.add_child(timer)
			timer.start()
			yield(timer, "timeout")
			effect.drive = 0.0
			if (get_parent().get_parent().get_node("glitch").visible == true):
				get_parent().get_parent().get_node("glitch").hide()
			$Sprite.texture = load(corrupt[manager.current])
			var t = Timer.new()
			t.set_wait_time(1.5)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
		elif fairy.energy >= 10 and fairy.energy < 12 and get_parent().get_parent().name == "level_two":
			get_parent().get_parent().get_node("glitch").show()
			AudioServer.add_bus_effect(AudioServer.get_bus_index("Master"), AudioEffectDistortion.new(), 0)
			var effect = AudioServer.get_bus_effect(AudioServer.get_bus_index("Master"), 0)
			effect.mode = 4
			effect.drive = 1.0
			var timer = Timer.new()
			timer.set_wait_time(1)
			timer.set_one_shot(true)
			self.add_child(timer)
			timer.start()
			yield(timer, "timeout")
			effect.drive = 0.0
			if (get_parent().get_parent().get_node("glitch").visible == true):
				get_parent().get_parent().get_node("glitch").hide()
			$Sprite.texture = load(human[manager.current])
			$Sprite.scale = Vector2(1.05, 1.05)
			var t = Timer.new()
			t.set_wait_time(1.5)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
		emit_signal("dead")
		emit_signal("popped", global_position)
		queue_free()
	
func _on_pinata_body_entered(body):
	if body.name.count("bat") > 0:
		health -= 1
	body.queue_free()
