extends Node


#记录 ImageBox 控件是否被选中。
var pictuer_is_selete = []
var picture_sun       = 0

func _ready():
	pass


func _physics_process(delta):
#	print(picture_sun)
	pass


func delete_image( i ):
	i.free()
