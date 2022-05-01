extends Position2D


var forword_x : float = 0.0
var forword_y : float = 0.0


func _physics_process(delta):
	forword_xy()


func forword_xy() -> void:
	#当前帧的鼠标位置
	var x = get_global_mouse_position().x
	var y = get_global_mouse_position().y
	var v_x = x - forword_x
	var v_y = y - forword_y
	
	forword_x = get_global_mouse_position().x
	forword_y = get_global_mouse_position().y
	
	if Input.get_action_strength( "Center" ):
		self.global_position.x += v_x
		self.global_position.y += v_y
