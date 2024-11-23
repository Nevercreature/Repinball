extends Camera2D



func _ready() -> void:
	_ajustar_Zoom() 
#---------------------------------------------------------------------------------------------------------------------
func _process(delta: float) -> void:
	
	_ajustar_Zoom()
	
	_seguir_a_la_bola()

#---------------------------------------------------------------------------------------------------------------------
func _ajustar_Zoom(): #Esto ajusta el zoom a un múltiplo de 360. El Full HD serían 1080 qye es una tercera parte
	var valor_zoom = round(get_viewport().size.y / 360)
	zoom = Vector2(valor_zoom, valor_zoom)
#--------------------------------------------------------------------------------------------------------------------	
func _seguir_a_la_bola(): #Si la bola va más allá de los límites puestos la cámara no se mueve para no salirse del area mostrable
	#Aquí se pilla la bola
	var bola = get_node("%Bola")
	
	if bola:
		if bola.position.y <= 125 and bola.position.y >= -125:
			position.y = bola.position.y
		elif bola.position.y > 125:
			position.y = 125
		else:
			position.y = -125 
	else:
		position.y = 125