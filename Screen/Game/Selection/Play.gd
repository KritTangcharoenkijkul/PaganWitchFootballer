extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var a
var random
var opprandom
var iswin
var selfscore = 0
var opposcore = 0
var currtime = 0
var currhalf = 1
var selfsacrifice = 3
var oppsacrifice = 3
var usesacrifice = 0
var oppusesac = 0
var ballposition = 3
var ballpossession = 0 # 0 is self 1 is opponent
var battleresult
var action = 0
var o


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Rock").grab_focus()
	var dialog = Dialogic.start('Introduction')
	$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/song.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func rolltheDice():
	
	$CornerKick/Sprite/sacri1.visible = false
	$CornerKick/Sprite/sacri2.visible = false
	random = randi() % 3
	opprandom = randi() % 30
	
	if opprandom == 5:
		oppusesac = 1
		opponentsacrifice(oppsacrifice)
		
	match random:
		0:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Opponent_Choice.text = "Rock"
		1:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Opponent_Choice.text = "Paper"
		2:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Opponent_Choice.text = "Scissor"
	
	if usesacrifice == 1 and oppusesac == 0: 
		var isWin = 0
		selfsacrifice = selfsacrifice - 1
		usesacrifice = 0
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Fireball.visible = false
		$CornerKick/Sprite/sacri2.visible = true
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/CurrentTime.text = "Win"
		makeselection()
		ballposition(isWin)
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/currentleft.text = str(selfsacrifice)
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/sac.play()
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/laugh.play()
		
		checkTime()
		
	elif usesacrifice == 0 and oppusesac == 1: 
		var isWin = 2
		oppsacrifice = oppsacrifice - 1
		oppusesac = 0
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Fireball.visible = false
		$CornerKick/Sprite/sacri1.visible = true
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/CurrentTime.text = "Lose"
		makeselection()
		ballposition(isWin)
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/currentleft.text = str(selfsacrifice)
		checkTime()
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/sac.play()
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/laugh.play()
	
	else:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Fireball2.visible = false
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Fireball.visible = false
		
		if random == a:
			var isWin = 1
			ballposition(isWin)
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/CurrentTime.text = "Draw"
			makeselection()
			checkTime()
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/draw.play()
		
		elif (a == 0 and random == 2) or (a == 1 and random == 0) or (a == 2 and random == 1):
			var isWin = 0
			ballposition(isWin)
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/CurrentTime.text = "Win"
			makeselection()
			checkTime()
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/win.play()
		else:
			var isWin = 2
			ballposition(isWin)
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/CurrentTime.text = "Lose"
			makeselection()
			checkTime()
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/lose.play()
		
		if usesacrifice == 1 and oppusesac == 1:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/sac.play()
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/laugh.play()
	
	
func makeselection():
	match a:
		0:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/paperself.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/scissorself.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/hammer.visible = true
		1:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/paperself.visible = true
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/scissorself.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/hammer.visible = false
		2:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/paperself.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/scissorself.visible = true
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/hammer.visible = false
	
	match random:
		0:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/paperopp.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/scissoropp.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/hammeropp.visible = true
		1:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/paperopp.visible = true
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/scissoropp.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/hammeropp.visible = false
		2:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/paperopp.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/scissoropp.visible = true
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/hammeropp.visible = false

func ballposition(isWin):
	
	if isWin == 0:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/FireballPurple.visible = true
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/FireballOrange.visible = false
	elif isWin == 1:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/FireballPurple.visible = true
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/FireballOrange.visible = true
	else:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/FireballPurple.visible = false
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/FireballOrange.visible = true
		
	match ballposition:
		1:
			if ballpossession == 0:
				match isWin:
					0:
						ballposition = 4
						action = 4
						
					1:
						ballposition = 3
						action = 4
					2:
						ballposition = 2
						action = 4
			else:
				match isWin:
					0:
						ballpossession = 0
						action = 10
						
					1:
						ballposition = 6
						action = 7
					2:
						AddScore(0)
						ballposition = 3
						ballpossession = 0
						action = 6
						
				
		2:
			if ballpossession == 0:
				match isWin:
					0:
						ballposition = 5
						action = 4
					1:
						ballposition = 4
						action = 4
					2:
						ballposition = 3
						action = 4
			else:
				match isWin:
					0:
						ballpossession = 0
						action = 3
					1:
						ballposition = 7
						action = 9
					2:
						AddScore(0)
						ballposition = 3
						ballpossession = 0
						action = 6
				
		3:
			if ballpossession == 0:
				match isWin:
					0:
						ballposition = 5
						action = 4
					1:
						ballposition = 8
						action = 4
					2:
						ballpossession = 1
						action = 8
			else:
				match isWin:
					0:
						ballpossession = 0
						action = 3
					1:
						ballposition = 7
						action = 9
					2:
						ballposition = 1
						action = 9
		4:
			if ballpossession == 0:
				match isWin:
					0:
						AddScore(1)
						ballposition = 3
						ballpossession = 1
						action = 1
					1:
						ballposition = 8
						action = 4
					2:
						ballpossession = 1
						action = 8
			else:
				match isWin:
					0:
						ballposition= 3
						action = 9
					1:
						ballposition = 2
						action = 9
					2:
						ballposition = 1
						action = 9
		5:
			if ballpossession == 0:
				match isWin:
					0:
						AddScore(1)
						ballposition = 3
						ballpossession = 1
						action = 1
					1:
						ballposition = 9
						action = 2
					2:
						ballpossession = 1
						action = 10
			else:
				match isWin:
					0:
						ballposition= 4
						action = 9
					1:
						ballposition = 3
						action = 9
					2:
						ballposition = 2
						action = 9
		6:
			if ballpossession == 0:
				match isWin:
					0:
						print("bug")
					1:
						print("bug")
					2:
						print("bug")
			else:
				match isWin:
					0:
						ballpossession = 0
						ballposition = 1
						action = 3
					1:
						ballposition = 2
						action = 9
					2:
						AddScore(0)
						ballposition = 3
						ballpossession = 0
						action = 6
		7:
			if ballpossession == 0:
				match isWin:
					0:
						ballposition = 8
						action = 4
					1:
						ballposition = 3
						action = 4
					2:
						ballposition = 2
						action = 4
			else:
				match isWin:
					0:
						ballpossession = 0
						action = 3
					1:
						ballposition = 2
						action = 9
					2:
						ballposition = 1
						action = 9
		8:
			if ballpossession == 0:
				match isWin:
					0:
						ballposition = 5
						action = 4
					1:
						ballposition = 4
						action = 4
					2:
						ballpossession = 1
						action = 8
			else:
				match isWin:
					0:
						ballposition = 4
						action = 9
					1:
						ballposition = 3
						action = 9
					2:
						ballposition = 7
						action = 9
		9:
			if ballpossession == 0:
				match isWin:
					0:
						AddScore(1)
						ballposition = 3
						ballpossession = 1
						action = 1
					1:
						ballposition = 4
						action = 4
					2:
						ballpossession = 1
						ballposition = 5
						action = 8
			else:
				match isWin:
					0:
						print("bug")
					1:
						print("bug")
					2:
						print("bug")
						
	
	
	
	disableball()
	match action:
		1:
			$CornerKick/Sprite/Goal.visible = true
		2:
			$CornerKick/Sprite/CornerKick.visible = true
		3:
			$CornerKick/Sprite/Interception.visible = true
		4:
			$CornerKick/Sprite/Pass.visible = true
		5:
			$CornerKick/Sprite/Goalkick.visible = true
		6: 
			$CornerKick/Sprite/Goal2.visible = true
		7:
			$CornerKick/Sprite/CornerKick2.visible = true
		8:
			$CornerKick/Sprite/Interception2.visible = true
		9:
			$CornerKick/Sprite/Pass2.visible = true
		10:
			$CornerKick/Sprite/Goalkick2.visible = true
	match ballposition:
		1:
			$Field/Sprite/ball1.visible = true
		2:
			$Field/Sprite/ball2.visible = true
		3:
			$Field/Sprite/ball3.visible = true
		4:
			$Field/Sprite/ball4.visible = true
		5:
			$Field/Sprite/ball5.visible = true
		6:
			$Field/Sprite/ball6.visible = true
		7:
			$Field/Sprite/ball7.visible = true
		8:
			$Field/Sprite/ball8.visible = true
		9:
			$Field/Sprite/ball9.visible = true
			
	if ballpossession == 0:
		$Field/Sprite/offense.visible = true
		$Field/Sprite/defense.visible = false
	else:
		$Field/Sprite/offense.visible = false
		$Field/Sprite/defense.visible = true
		
	
		
func disableball():
		$Field/Sprite/ball1.visible = false
		$Field/Sprite/ball2.visible = false
		$Field/Sprite/ball3.visible = false
		$Field/Sprite/ball4.visible = false
		$Field/Sprite/ball5.visible = false
		$Field/Sprite/ball6.visible = false
		$Field/Sprite/ball7.visible = false
		$Field/Sprite/ball8.visible = false
		$Field/Sprite/ball9.visible = false
		$CornerKick/Sprite/Goal.visible = false
		$CornerKick/Sprite/Goalkick.visible = false
		$CornerKick/Sprite/Interception.visible = false
		$CornerKick/Sprite/Pass.visible = false
		$CornerKick/Sprite/CornerKick.visible = false
		$CornerKick/Sprite/Goal2.visible = false
		$CornerKick/Sprite/Goalkick2.visible = false
		$CornerKick/Sprite/Interception2.visible = false
		$CornerKick/Sprite/Pass2.visible = false
		$CornerKick/Sprite/CornerKick2.visible = false
		$CornerKick/Sprite/start.visible = false
		
		
func checkTime():
	currtime = currtime + 1
	$CornerKick/Sprite/halftime.visible = false
	$CornerKick/Sprite/fulltime.visible = false
	if currhalf == 1:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/Label.text = ("1st\n" + str(currtime) + ":00")
	else:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/Label.text = ("2nd\n" + str(currtime) + ":00")
		
	if selfsacrifice == 2:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/purpman3.visible = false
	elif selfsacrifice == 1:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/purpman2.visible = false
	elif selfsacrifice == 0:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/purpman.visible = false
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Sacrifice.visible = false
		
	if currtime == 46 and currhalf == 1:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/Label.text = ("Half\nTime")
		$CornerKick/Sprite/halftime.visible = true
		currhalf = 2
		currtime = 45
		ballposition = 3
		ballpossession = 1
		
	elif currtime == 91 and currhalf == 2:
		if selfscore > opposcore:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/Label.text = ("You\nWin")
		elif opposcore > selfscore:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/Label.text = ("You\nLose")
		else:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/ColorRect/Label.text = ("Draw")
		$CornerKick/Sprite/fulltime.visible = true
		ballposition = 3
		
	elif currtime == 92:
		Global.skipcutscene = 1
		if selfscore > opposcore:
			get_tree().change_scene("res://Screen/Game/Cutscene/TestCutscene2.tscn")
			Global.lives = 1
			Global.unlockA = 1
		elif opposcore > selfscore:
			get_tree().change_scene("res://Screen/Game/Cutscene/TestCutscene4.tscn")
			Global.lives = 2
			Global.unlockB = 1
		else:
			get_tree().change_scene("res://Screen/Game/Cutscene/TestCutscene3.tscn")
			Global.lives = 3
			Global.unlcokC = 1
		
func AddScore(isWin):
	$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/goal.play()
	if isWin == 1:
		selfscore = selfscore + 1
		$MarginContainer/MarginContainer/VBoxContainer/MarginContainer/Score/HBoxContainer/ColorRect/MarginContainer2/YourTeamScore.text = str(selfscore)
	else:
		opposcore = opposcore + 1
		$MarginContainer/MarginContainer/VBoxContainer/MarginContainer/Score/HBoxContainer/ColorRect2/MarginContainer3/OpponentTeamScore.text = str(opposcore)

func _on_Rock_pressed():
	a = 0
	rolltheDice()


func _on_Paper_pressed():
	a = 1
	rolltheDice()


func _on_Scissor_pressed():
	a = 2
	rolltheDice()

func opponentsacrifice(oppsacrifice):
	
	match oppsacrifice:
		1:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/symbol4.visible = true
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/orange.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Fireball2.visible = true
		2:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/symbol5.visible = true
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/orange2.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Fireball2.visible = true
		3:
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/symbol6.visible = true
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/orange3.visible = false
			$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Fireball2.visible = true

func _on_Sacrifice_pressed():
	if usesacrifice == 0 and selfsacrifice != 0:
		usesacrifice = 1
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Fireball.visible = true
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/presac.play()
		match selfsacrifice:
			1:
				$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/symbol.visible = true
			2:
				$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/symbol2.visible = true
			3:
				$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/symbol3.visible = true
	else:
		usesacrifice = 0
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/Fireball.visible = false
		match selfsacrifice:
			1:
				$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/symbol.visible = false
			2:
				$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/symbol2.visible = false
			3:
				$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/ColorRect/symbol3.visible = false
