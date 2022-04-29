extends Control


onready var ImageBox = preload( "res://Resource/StaticWindow/ImageBox.tscn" )
onready var Transforma = $ScrollContainer/Box

var _position : Vector2


func _ready():
	get_tree().connect( "files_dropped", self, "on_file_drag" )


func _physics_process( _delta : float ) -> void:
	_position = Vector2(get_global_mouse_position().x, get_global_mouse_position().y)


#从外部倒入文件
func on_file_drag( var files, var _screen ):
	for f in files:
		var textuer = ImageTexture.new()
		var image   = Image.new()
		var imagebox = ImageBox.instance()

		image.load( f )
		textuer.create_from_image( image )
		imagebox.texture = textuer
		
		imagebox.global_position = _position
		Transforma.add_child( imagebox )
