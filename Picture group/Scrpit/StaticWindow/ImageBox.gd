extends Sprite


#控制组件的移动和缩放
class_name ImageBox


var is_yes 	 : bool  = false
var is_salce : bool  = false
var sales_v  : float = .04
var th_mouse

var forword_x : float = 0.0
var forword_y : float = 0.0

var onreaddown : bool = false


func _ready() -> void:
	#将控件加入到Global.pictuer_is_selete
	Global.pictuer_is_selete.push_back( false )


func _physics_process( _delta : float ) -> void:
	if !onreaddown:
		forword_x = get_global_mouse_position().x
		forword_y = get_global_mouse_position().y
		onreaddown = true
	
	if is_yes:
		move()
	
	if is_salce:
		salces()


func _input( event ) -> void:
	if !is_selete():
		#鼠标左键一下移动
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
			if get_rect().has_point(to_local(event.position)):
				Global.pictuer_is_selete[ get_parent().get_index() ] = true
				var _x = get_global_mouse_position().x
				var _y = get_global_mouse_position().y
	#			if !is_selete():
				is_yess()
		
		#鼠标右键一下缩放
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
			if get_rect().has_point(to_local(event.position)):
				Global.pictuer_is_selete[ get_parent().get_index() ] = true
				is_salces()
				th_mouse = get_global_mouse_position()

	#不再图像的范围内点鼠标后不再缩放或移动
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
		if !get_rect().has_point(to_local(event.position)):
			is_salce = false
			Global.pictuer_is_selete[ get_parent().get_index() ] = false
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if !get_rect().has_point(to_local(event.position)):
			is_yes = false
			Global.pictuer_is_selete[ get_parent().get_index() ] =  false


#用于消除选择 ImageBox 控件重叠时的重复选择。
#如果有被选择的 ImageBox 控件就返回 true。否则就返回 false。
#true 就意味着已经有被选中的 ImageBox 控件， 这样就不可以多选其他的 ImageBox 控件。
func is_selete() -> bool:
	for i in Global.pictuer_is_selete:
		if i:
			return true
	return false


#是否缩放
func is_salces() -> void:
	is_salce = !is_salce


#是否移动
func is_yess() -> void:
	is_yes = !is_yes


#缩放
func salces() -> void:
	var _aposition = self.get_global_position()
	var ao = th_mouse - _aposition
#	ao = abs(ao)
	
	var _mposition = get_global_mouse_position()
	var bo = _mposition - th_mouse
#	bo = abs(bo)
	
	self.global_scale.x = (bo/ao).x
	self.global_scale.y = (bo/ao).x


#移动
func move():
	is_salce = false

	global_position.x = get_global_mouse_position().x
	global_position.y = get_global_mouse_position().y


#容器的大小
func picture_salec():
	pass

