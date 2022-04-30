extends Control


onready var LabelSun = $HBoxContainer/Label

var pic : String = "图片数量："
var sunimage : int = 0


func _physics_process( delta : float ) -> void:
	set_label_text( Global.picture_sun )
	LabelSun.text = pic + String(sunimage) 


func set_label_text( var i : int ) -> void:
	sunimage = i
