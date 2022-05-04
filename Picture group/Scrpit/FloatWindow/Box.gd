extends Sprite


var is_yes 	 : bool  = false

var forword_x : float = 0.0
var forword_y : float = 0.0


func _ready():
	pass


func _physics_process( _delta : float ) -> void:
	if is_yes:
		move()


func _input( event ) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if !is_selete():
				Global.tag_is_selete[ get_index() ] = true
			is_yess()


#用于消除选择 Tag 控件重叠时的重复选择。
#如果有被选择的 Tag 控件就返回 true。否则就返回 false。
#true 就意味着已经有被选中的 Tag 控件， 这样就不可以多选其他的 Tag 控件。
func is_selete() -> bool:
	for i in Global.pictuer_is_selete:
		if i:
			return true
	return false


func is_yess() -> void:
	is_yes = !is_yes
	if !is_yes:
		Global.tag_is_selete[ get_index() ] = false


func get_global_x() -> float:
	return global_position.x


func get_global_y() -> float:
	return global_position.y


func move() -> void:
	self.global_position.x = get_global_mouse_position().x
	self.global_position.y = get_global_mouse_position().y
