extends Position2D


class_name GlobalSalce


var forword_x : float = 0.0
var forword_y : float = 0.0


#让画布回到初始位置和初始缩放
func to_defaul() -> void:
	if Input.is_action_just_pressed( "to_default" ):
		self.global_position = Vector2( 0.0, 0.0 )
		self.global_scale    = Vector2( 1.0, 1.0 )


#滚轮缩放整个画布
func salce_sy() -> void:
	#获得鼠标掩码 向上滚轮 8 向下 16
	if Input.get_mouse_button_mask() == 8:
		self.global_scale *= 1.2
	if Input.get_mouse_button_mask() == 16:
		self.global_scale *= 0.8


#鼠标中键拖动整个画布
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
