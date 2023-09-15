extends Control

@onready var startB = $Menu/TextureRect/Control/MenuButton/Start
@onready var leaveB = $Menu/TextureRect/Control/MenuButton/Leave
# Called when the node enters the scene tree for the first time.

signal pause
signal end
signal startGame
signal leave

func _on_start_button_down():
	print("click click", startB.text)
	if(startB.text == "Iniciar Juego"):
		emit_signal("startGame")
	else:
		startB.text = "Continuar"
		emit_signal("pause")


func _on_leave_button_down():
	emit_signal("leave")
