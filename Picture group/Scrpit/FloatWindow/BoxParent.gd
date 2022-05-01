extends Sprite


onready var Sprite1 = $Sprite


func _physics_process( delta : float ) -> void:
	self.global_position.x = Sprite1.get_global_x()
	self.global_position.y = Sprite1.get_global_y()
	print( Sprite1.get_global_x(), " " ,Sprite1.get_global_y() )
	pass
