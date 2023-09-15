extends Control

@onready var nramas = $Armas/MarginContainer/HBoxContainer/Rama/Nro
@onready var nlanzas = $Armas/MarginContainer/HBoxContainer/Lanza/Nro
@onready var npiedras = $Armas/MarginContainer/HBoxContainer/Piedra/Nro


@onready var nwhite = $Stormtroopers/MarginContainer/HBoxContainer/StormWhite/Nro
@onready var ngray = $Stormtroopers/MarginContainer/HBoxContainer/StormGray/Nro
@onready var nbrown = $Stormtroopers/MarginContainer/HBoxContainer/StromBrown/Nro
var nroInit = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	nramas.text = str(0)
	nlanzas.text = str(0)
	npiedras.text = str(0)
	nwhite.text = str(0)
	ngray.text = str(0)
	nbrown.text = str(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_background_show_items_in_ui(list_items):
	nramas.text = str(list_items[2])
	nlanzas.text = str(list_items[0])
	npiedras.text = str(list_items[1])
