extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var new_dialog = Dialogic.start('Finish')
	add_child(new_dialog)
	new_dialog.connect("timeline_end",self, "after_dialog")
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func after_dialog(timeline_name):
	get_tree().change_scene("res://Screen/Menu/Menu.tscn")
