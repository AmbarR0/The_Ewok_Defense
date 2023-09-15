extends Control

@onready var start = $Menu/Menu/TextureRect/Control/MenuButton/Start
@onready var leave = $Menu/Menu/TextureRect/Control/MenuButton/Leave
# Called when the node enters the scene tree for the first time.
func _ready():
	start.text = "Iniciar Juego"

func _on_start_button_down():
	start.text = "Iniciar Juego"
	get_tree().change_scene_to_file("res://scenes/control.tscn")


func _on_leave_button_down():
	get_tree().quit()


func _on_control_send_end():
	get_tree().quit()


func _on_control_send_menu():
	start.text = "Continuar"
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_menu_end():
	#show record
	pass


func _on_menu_pause():

	print("pan")
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_menu_start_game():
	print("uwu")
	_on_start_button_down()


func _on_menu_leave():
		get_tree().quit()
