extends Camera2D

var panel004

func _ready() -> void:
	_ajustar_Zoom_pixel_perfect() 
	panel004 = get_node("/root/Node2D/Pinball/Paredes/ParedesSprite/Panel004")
#---------------------------------------------------------------------------------------------------------------------
func _process(delta: float) -> void:
	
	_ajustar_Zoom_pixel_perfect()
	
	_seguir_a_la_bola()

#---------------------------------------------------------------------------------------------------------------------
func _ajustar_Zoom_pixel_perfect(): #Esto ajusta el zoom a un múltiplo de 360. El Full HD serían 1080 qye es una tercera parte
	
	var valor_y_de_escena = float(360)
	
	var valor_zoom = round(get_viewport().size.y / valor_y_de_escena)

	zoom = Vector2(valor_zoom, valor_zoom)

func _ajustar_Zoom_dinamico(): #Esto ajusta el zoom a un múltiplo de 360. El Full HD serían 1080 qye es una tercera parte
	

	#Esto es para zoom dinamico
	var valor_y_de_escena = float(360)
	
	var valor_zoom = get_viewport().size.y / valor_y_de_escena
	print("La proporcion :",get_viewport().size.y / valor_y_de_escena)
	print("Viewport en Y :",get_viewport().size.y)
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

func sacude_camara():
	if panel004 != null:
		panel004.play("Sobrecalentamiento")
	var posicion_actual = position
	var tiempo_espera = 0.04
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x+5,posicion_actual.y+3)
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x+5,posicion_actual.y-2)
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x,posicion_actual.y)
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x-6,posicion_actual.y+6)
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x-4,posicion_actual.y-2)
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x+2,posicion_actual.y+6)
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x-1,posicion_actual.y+6)
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x+7,posicion_actual.y+3)
	await get_tree().create_timer(tiempo_espera).timeout
	position = Vector2(posicion_actual.x+5,posicion_actual.y+3)
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x+5,posicion_actual.y-2)
	await get_tree().create_timer(tiempo_espera).timeout 
	position = Vector2(posicion_actual.x,posicion_actual.y)
	await get_tree().create_timer(tiempo_espera).timeout  
	position = posicion_actual
	
