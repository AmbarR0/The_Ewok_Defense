extends Control
 
signal Get_to_game
signal Close_window

func _on_continue_button_down():
	emit_signal("Get_to_game")


func _on_close_button_down():
	emit_signal("Close_window")
