extends Camera2D
@export var cam_speed := 10
var x_dir
var y_dir
var zoom_speed = 1.1

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
	if Input.is_action_pressed("zoom in"):
		$".".zoom *= Vector2(zoom_speed,zoom_speed)
		$Control.scale /= Vector2(zoom_speed,zoom_speed)
	if Input.is_action_pressed("zoom out"):
		$".".zoom /= Vector2(zoom_speed,zoom_speed)
		$Control.scale *= Vector2(zoom_speed,zoom_speed)
	
	self.position += Vector2(cam_speed*x_dir/zoom.x, cam_speed*y_dir/zoom.y)
	
	
	
