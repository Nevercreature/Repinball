extends Node

var separador
var puntos_entero
var puntos_string
var nodo_puntos
var nodo_puntos_sombra
var nodo_puntos_sombra2
var nodo_puntos_sombra3
var nodo_puntos_sombra4
var nodo_puntos_sombra5

var nodo_sprite_bola
var nodo_sprite_moneda

var canvas_layer

var valor_zoom: int

var botonL1
var botonR1

var bola

var vidas

var panel_soltar_bola

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	separador = "." # Replace with function body.
	puntos_entero = 0
	nodo_puntos = get_node("../CanvasLayer/Puntos")
	nodo_puntos_sombra = get_node("../CanvasLayer/Puntos/PuntosSombra")
	nodo_puntos_sombra2 = get_node("../CanvasLayer/Puntos/PuntosSombra2")
	nodo_puntos_sombra3 = get_node("../CanvasLayer/Puntos/PuntosSombra3")
	nodo_puntos_sombra4 = get_node("../CanvasLayer/Puntos/PuntosSombra4")
	nodo_puntos_sombra5 = get_node("../CanvasLayer/Puntos/PuntosSombra5")
	
	nodo_sprite_bola = get_node("../CanvasLayer/BolaInterfaz")
	nodo_sprite_moneda = get_node("../CanvasLayer/MonedaInterfaz")

	canvas_layer = get_node("../CanvasLayer")
	
	botonL1 = get_node("%ButtonIzqLanzar")
	botonR1 = get_node("%ButtonDerLanzar")
	
	bola = get_node("%Bola")
	panel_soltar_bola = get_node("%PanelSoltarBola")
	
	vidas = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if round(get_viewport().size.y / 360) > 1:
		valor_zoom = round(get_viewport().size.y / 360)
	else:
		valor_zoom = 1

	
	puntos_string = formatea_numeros_con_puntos(puntos_entero)
	nodo_puntos.text = puntos_string
	nodo_puntos_sombra.text = puntos_string
	nodo_puntos_sombra2.text = puntos_string
	nodo_puntos_sombra3.text = puntos_string
	nodo_puntos_sombra4.text = puntos_string
	nodo_puntos_sombra5.text = puntos_string
	
	
	
	nodo_puntos.scale.y = valor_zoom
	nodo_puntos.scale.x = valor_zoom

	nodo_sprite_bola.scale.x = valor_zoom
	nodo_sprite_bola.scale.y = valor_zoom
	
	nodo_sprite_moneda.scale.x = valor_zoom
	nodo_sprite_moneda.scale.y = valor_zoom
	
	#control_de_la_bola()
	
func formatea_numeros_con_puntos(puntos_entero: int) -> String:
	var str_number = str(puntos_entero)
	var parts = str_number.split(".")  # Divide entre parte entera y decimal
	var integer_part = parts[0]
	var decimal_part
	if parts.size() > 1:
		decimal_part = "." + parts[1]
	else:
		decimal_part = ""

	var formatted_integer = ""
	var counter = 0

	# Itera desde el final al principio para insertar los puntos
	for i in range(integer_part.length() - 1, -1, -1):
		formatted_integer = integer_part[i] + formatted_integer
		counter+=1
		if counter % 3 == 0 and i > 0:
			formatted_integer = "." + formatted_integer
	return formatted_integer + decimal_part
	#print(nodo_puntos_sombra.name)
'''
func formatea_numeros_con_ceros(number: int) -> String:
	var number_str = str(number)
	var zeros_needed = max(0, 9 - number_str.length())
	var padding = ""
	for i in range(zeros_needed):
		padding +="0"
	var padded = padding + number_str
	var formatted = padded.substr(0, 3)+separador+padded.substr(3, 3)+separador+padded.substr(6, 3)
	return formatted
'''
func teletransportar_bola(nueva_posicion: Vector2):
	# Cambiamos el estado de "sleeping" para evitar que se quede congelado. Y que no sea visible mientras se transporta
	#bola.visible = true
	bola.global_position.y = nueva_posicion.y #bola.global_position.y = nueva_posicion.y
	bola.global_position.x = nueva_posicion.x #bola.global_position.x = nueva_posicion.x


	####################################################################### Esto es el reseteo de la bola
	#await get_tree().create_timer(1).timeout #await get_tree().create_timer(0.5).timeout
	bola.gravity_scale = bola.gravedad
	#bola.freeze = false
	bola.visible = true
	####################################################################

func _input(event):
	if event.is_action_pressed("L1"):
		teletransportar_bola(Vector2(-180.5,140))
		#panel_soltar_bola.freeze = true
		panel_soltar_bola.visible = false

	if event.is_action_pressed("R1"):
		teletransportar_bola(Vector2(+180.5,140))
		#panel_soltar_bola.freeze = true
		panel_soltar_bola.visible = false
