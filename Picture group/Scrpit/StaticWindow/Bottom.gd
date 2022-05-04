extends Control


onready var LabelSun = $HBoxContainer/Label
onready var Github   = $HBoxContainer/Github

var pic : String = "图片数量："
var sunimage : int = 0


func _ready() -> void:
	Github.connect( "button_down", self, "down" )


func _physics_process( delta : float ) -> void:
	set_label_text( Global.picture_sun )
	LabelSun.text = pic + String(sunimage) 


func set_label_text( var i : int ) -> void:
	sunimage = i


func down() -> void:
	Global.HelpWindow.popup_centered( Vector2(500.0, 400.0) ) 
