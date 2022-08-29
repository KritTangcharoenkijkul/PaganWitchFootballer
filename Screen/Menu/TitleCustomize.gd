extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorRect/Back").grab_focus()
	
	match Global.lives:
		0:
			$ColorRect/FireballOrigin.visible = true
		1:
			$ColorRect/FireballWin.visible = true
		2:
			$ColorRect/FireballLose.visible = true
		3:
			$ColorRect/FireballDraw.visible = true
			
	
	if Global.unlockA == 1:
		$ColorRect/LockB.visible = true
		$ColorRect/ImageWin.visible = true
	if Global.unlockB == 1:
		$ColorRect/LockC.visible = true
		$ColorRect/ImageLose.visible = true
	if Global.unlcokC == 1:
		$ColorRect/LockA.visible = true
		$ColorRect/ImageDraw.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_pressed():
	get_tree().change_scene("res://Screen/Menu/Menu.tscn")


func _on_Normal_pressed():
	Global.lives = 0
	
	$ColorRect/FireballOrigin.visible = true
	$ColorRect/FireballWin.visible = false
	$ColorRect/FireballLose.visible = false
	$ColorRect/FireballDraw.visible = false


func _on_LockA_pressed():
	Global.lives = 3
	$ColorRect/FireballOrigin.visible = false
	$ColorRect/FireballWin.visible = false
	$ColorRect/FireballLose.visible = false
	$ColorRect/FireballDraw.visible = true


func _on_LockB_pressed():
	Global.lives = 1
	$ColorRect/FireballOrigin.visible = false
	$ColorRect/FireballWin.visible = true
	$ColorRect/FireballLose.visible = false
	$ColorRect/FireballDraw.visible = false


func _on_LockC_pressed():
	Global.lives = 2
	$ColorRect/FireballOrigin.visible = false
	$ColorRect/FireballWin.visible = false
	$ColorRect/FireballLose.visible = true
	$ColorRect/FireballDraw.visible = false

