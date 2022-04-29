extends Sprite


class_name ImageBox


var is_yes 	 : bool  = false
var is_salce : bool  = false
var salec    : float = 1.0
var sales_v  : float = .04
var th_mouse

var forword_x : float = 0.0
var forword_y : float = 0.0

var onreaddown : bool = false


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
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			var _x = get_global_mouse_position().x
			var _y = get_global_mouse_position().y
			is_yess()
	
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
		if get_rect().has_point(to_local(event.position)):
			is_salces()
			th_mouse = get_global_mouse_position()

	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
		if !get_rect().has_point(to_local(event.position)):
			is_salce = false
			
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if !get_rect().has_point(to_local(event.position)):
			is_yes = false

#	if Input.is_action_just_pressed("Move") and ( is_yes or is_salce ):
#		is_salce = false
#		is_yes   = false
	
	if Input.is_action_just_pressed( "delete" ):
		Global.delete_image( self )


func is_salces() -> void:
	is_salce = !is_salce


func is_yess() -> void:
	is_yes = !is_yes


func delete_image() -> void:
	self.free()


func salces() -> void:
	var _aposition = self.get_global_position()
	var ao = th_mouse - _aposition
#	ao = abs(ao)
	
	var _mposition = get_global_mouse_position()
	var bo = _mposition - th_mouse
#	bo = abs(bo)
	
	self.global_scale.x = (bo/ao).x
	self.global_scale.y = (bo/ao).x
	
#	is_yes = false
#
#	var x = get_global_mouse_position().x
#	var v_x = x - forword_x
#
#	forword_x = get_global_mouse_position().x
#
#	if v_x > 0:
#		self.global_scale.x *= 1.1
#		self.global_scale.y *= 1.1
#	elif v_x < 0:
#		self.global_scale.x *= 0.9
#		self.global_scale.y *= 0.9
	pass


func move():
	is_salce = false
	
#	var x = get_global_mouse_position().x
#	var y = get_global_mouse_position().y
#
#	var v_x = x - forword_x
#	var v_y = y - forword_y
#
#	forword_x = get_global_mouse_position().x
#	forword_y = get_global_mouse_position().y

#	global_position.x += v_x
#	global_position.y += v_y

	global_position.x = get_global_mouse_position().x
	global_position.y = get_global_mouse_position().y


#容器的大小
func picture_salec():
	pass

