extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorRect/HBoxContainer/VBoxContainer/VBoxContainer/Start").grab_focus()
	$AudioStreamPlayer.play()
	
	if Global.skipcutscene == 1:
		$ColorRect/HBoxContainer/VBoxContainer/VBoxContainer/Skip.visible = true
	
	
	if Global.lives == 1:
		$ColorRect/HBoxContainer/VBoxContainer2/Fireball2.visible = true
		$ColorRect/HBoxContainer/VBoxContainer2/SelfWin.visible = true
		
		$ColorRect/HBoxContainer/VBoxContainer2/Fireball.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfDefault.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfDraw.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfLose.visible = false
	elif Global.lives == 2:
		$ColorRect/HBoxContainer/VBoxContainer2/SelfLose.visible = true
		$ColorRect/HBoxContainer/VBoxContainer2/Fireball2.visible = true
		
		$ColorRect/HBoxContainer/VBoxContainer2/Fireball.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfDefault.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfDraw.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfWin.visible = false
	elif Global.lives == 3:
		$ColorRect/HBoxContainer/VBoxContainer2/SelfDraw.visible = true
		$ColorRect/HBoxContainer/VBoxContainer2/Fireball.visible = true
		
		$ColorRect/HBoxContainer/VBoxContainer2/SelfLose.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfWin.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfDefault.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/Fireball2.visible = false
		
	else:
		$ColorRect/HBoxContainer/VBoxContainer2/SelfDefault.visible = true
		$ColorRect/HBoxContainer/VBoxContainer2/Fireball.visible = true
		
		$ColorRect/HBoxContainer/VBoxContainer2/SelfLose.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfWin.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/SelfDraw.visible = false
		$ColorRect/HBoxContainer/VBoxContainer2/Fireball2.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://Screen/Game/Cutscene/TestCutscene.tscn")

func _on_Option_pressed():
	get_tree().change_scene("res://Screen/Menu/TitleCustomize.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Skip_pressed():
	get_tree().change_scene("res://Screen/Game/Selection/Play.tscn")
