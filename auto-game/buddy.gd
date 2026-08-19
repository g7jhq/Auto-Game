extends AnimatedSprite2D
var health := 100
var speed := 5
var water := 100
var rng := RandomNumberGenerator.new()

enum Need {WATER, FOOD, SHELTER}

func _physics_process(delta: float) -> void:
	water -= 1
	if water < 50:
		pathTo(Need.WATER)
	else:
		explore()

func find(obj) -> Path2D:
	return Path2D.new()

func pathTo(obj) -> void:
	var path = find(obj)

func move(dir):
	pass

func explore():
	move(rng.randf())
