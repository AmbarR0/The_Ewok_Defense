extends Control

@onready var menuB = $TopUI/Menu

signal sendMenu
signal sendEnd
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_top_ui_pause():
	emit_signal("sendMenu")


func _on_top_ui_game_over(time):
	emit_signal("sendEnd", time)
