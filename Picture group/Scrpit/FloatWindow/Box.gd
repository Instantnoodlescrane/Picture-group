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
			is_yess()


func is_yess() -> void:
	is_yes = !is_yes


func get_global_x() -> float:
	return global_position.x


func get_global_y() -> float:
	return global_position.y


func move() -> void:
	self.global_position.x = get_global_mouse_position().x
	self.global_position.y = get_global_mouse_position().y
