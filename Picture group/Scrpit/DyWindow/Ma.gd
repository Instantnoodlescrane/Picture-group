extends GlobalSalce


onready var Tag   = preload( "res://Resource/FloatWindow/Tag.tscn" )

#前一帧的鼠标位置

var child_control : int = 0
var _position : Vector2


func _physics_process( _delta : float ) -> void:
	_position = Vector2(get_global_mouse_position().x, get_global_mouse_position().y)
	Global.picture_sun = get_image_boxs()
	forword_xy()


func _input(event):
#	self.global_scale *= (((Input.get_mouse_button_mask()-12)/4)*0.2)
	salce_sy()
	to_defaul()


func is_selete() -> int:
	var index = 0
	
	for i in Global.pictuer_is_selete:
		index += 1
	return index


#当前有多少图片
func get_image_boxs() -> int:
	return self.get_child_count() - 1


func delete_image_box( i ) -> void:
	pass
#	get_child( i ).free_queue()
