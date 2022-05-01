extends Control


onready var Tag		   = preload( "res://Resource/FloatWindow/Tag.tscn" )
onready var ImageBox   = preload( "res://Resource/StaticWindow/ImageBox.tscn" )

onready var Tagss	   = $ScrollContainer/Box/Tags
onready var Transforms = $ScrollContainer/Box/Transform

var _position : Vector2


func _ready() -> void:
	get_tree().connect( "files_dropped", self, "on_file_drag" )


func _physics_process( _delta : float ) -> void:
	_position = Vector2(get_global_mouse_position().x, get_global_mouse_position().y)


func _input( event ) -> void:
	if Input.is_action_just_pressed( "AddTag" ):
		add_tag()


#从外部倒入文件
func on_file_drag( var files, var _screen ) -> void:
	for f in files:
		add_image_box(f)


#添加图片
func add_image_box( var f ) -> void:
	var textuer = ImageTexture.new()
	var image   = Image.new()
	var imagebox = ImageBox.instance()

	image.load( f )
	textuer.create_from_image( image )
	imagebox.texture = textuer
	
	imagebox.global_position = _position
	Transforms.add_child( imagebox )


#添加 Tag
func add_tag() -> void:
	var tag = Tag.instance()
	Tagss.add_child( tag )
