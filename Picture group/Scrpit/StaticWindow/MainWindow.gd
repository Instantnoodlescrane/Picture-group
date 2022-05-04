extends Control


onready var HelpWindow = $HelpWindow


func _ready() -> void:
	Global.HelpWindow = HelpWindow
#	OS.window_borderless = true



func _input( event ) -> void:
	if Input.is_action_just_pressed( "Help" ):
		help_window()


#显示帮助文件
func help_window() -> void:
	HelpWindow.popup_centered( Vector2( 500, 500 ) )
