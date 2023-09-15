extends Node2D

signal showItemsInUI
signal startItems
@onready var item2 = $Item2
@onready var item3 = $Item3
@onready var item4 = $Item4
@onready var item5 = $Item5
@onready var item6 = $Item6

func _ready():
	item2.number = 2
	item3.number = 3
	item4.number = 4
	item5.number = 5
	item6.number = 6

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_ewok_change_items(list_items):
	print("this is connected")
	emit_signal("showItemsInUI", list_items)
	
