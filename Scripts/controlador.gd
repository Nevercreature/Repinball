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

var canvas_layer

var valor_zoom: int

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

	canvas_layer = get_node("../CanvasLayer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if round(get_viewport().size.y / 360) > 1:
		valor_zoom = round(get_viewport().size.y / 360)
	else:
		valor_zoom = 1

	
	puntos_string = formatea_numeros_con_ceros(puntos_entero)
	nodo_puntos.text = puntos_string
	nodo_puntos_sombra.text = puntos_string
	nodo_puntos_sombra2.text = puntos_string
	nodo_puntos_sombra3.text = puntos_string
	nodo_puntos_sombra4.text = puntos_string
	nodo_puntos_sombra5.text = puntos_string
	
	'''
	#nodo_puntos.control.layout.transform.scale.x = valor_zoom
	print("Canvas Layer scale: ", canvas_layer.scale)
	print("El viewpor entre 360", (get_viewport().size.y / 360))
	print("valor zoom: ", valor_zoom)
	#nodo_puntos.font.size = valor_zoom * 32
	#var zoom_valor_int = valor_zoom.to_int()
	#canvas_layer.set_scale(Vector2(valor_zoom, valor_zoom))
	'''
	
	nodo_puntos.scale.y = valor_zoom
	nodo_puntos.scale.x = valor_zoom

	'''
	nodo_puntos_sombra.scale.y = valor_zoom
	nodo_puntos_sombra.scale.x = valor_zoom
	
	nodo_puntos_sombra2.scale.y = valor_zoom
	nodo_puntos_sombra2.scale.x = valor_zoom
	
	nodo_puntos_sombra3.scale.y = valor_zoom
	nodo_puntos_sombra3.scale.x = valor_zoom
	
	nodo_puntos_sombra4.scale.y = valor_zoom
	nodo_puntos_sombra4.scale.x = valor_zoom
	'''
	
	
	
	#print(nodo_puntos_sombra.name)

func formatea_numeros_con_ceros(number: int) -> String:
	var number_str = str(number)
	var zeros_needed = max(0, 9 - number_str.length())
	var padding = ""
	for i in range(zeros_needed):
		padding +="0"
	var padded = padding + number_str
	var formatted = padded.substr(0, 3)+separador+padded.substr(3, 3)+separador+padded.substr(6, 3)
	return formatted