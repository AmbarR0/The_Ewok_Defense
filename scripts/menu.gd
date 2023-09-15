extends Control

signal  Get_to_game
signal Close_window

func _on_start_button_down():
	emit_signal("Get_to_game")


func _on_leave_button_down():
	emit_signal("Close_window")
