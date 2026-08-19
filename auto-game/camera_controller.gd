extends Camera2D
@export var cam_speed := 10
var x_dir
var y_dir

func _physics_process(delta: float) -> void:
	x_dir = 0
	y_dir = 0
	if Input.is_action_pressed("up"):
		y_dir = -1
	if Input.is_action_pressed("down"):
		y_dir = 1
	if Input.is_action_pressed("left"):
		x_dir = -1
	if Input.is_action_pressed("right"):
		x_dir = 1
	
	self.position += Vector2(cam_speed*x_dir, cam_speed*y_dir)

func zoom(amnt):
	var change = Vector2(amnt, amnt)
	
	
	
