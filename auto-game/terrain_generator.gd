extends Node2D
@export var noise : FastNoiseLite
@export var width := 512
@export var height := 512
@export var noise_scale := 0.1
@export var terrain : TileMapLayer
@export var water_height := -0.1
@export var sand_height := -0.05
@export var grass_height := 0.0
@export var forest_height := 0.1
var rng = RandomNumberGenerator.new()
func _ready() -> void:
	terrain.clear()
	noise.seed = rng.randi()
	generate_terrain()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("restart"):
		generate_terrain()
	

func generate_terrain() -> void:
	for x in range(width):
		for y in range(height):
			var n2d = noise.get_noise_2d(x*noise_scale, y*noise_scale)
			if n2d < water_height:
				terrain.set_cell(Vector2i(x,y), 0, Vector2i(0,4))
			elif n2d < sand_height && sand_height >= water_height:
				terrain.set_cell(Vector2i(x,y), 0, Vector2i(4,0))
			elif n2d < grass_height && grass_height >= sand_height:
				terrain.set_cell(Vector2i(x,y), 0, Vector2i(0,0))
			else:
				terrain.set_cell(Vector2i(x,y), 0, Vector2i(4,4))
