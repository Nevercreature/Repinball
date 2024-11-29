extends Node2D

# Variables para los ángulos (en radianes)
var target_angle = deg_to_rad(-63)  # Ángulo objetivo al presionar el botón ¡OJO AL DATO! el recorrido total va de 0 a -1.1
var original_angle = deg_to_rad(0)  # Ángulo original (0 radianes)
var rotation_speed = 26   # Velocidad de rotación
var rotating = false # Si está rotando o no
var boton_izquierdo
var luzL
var luzR
#--------------------------------------------------------------------------------------------------------------------	
func _ready():
	# Aquí se pilla el botón izquierdo
	boton_izquierdo = get_node("%ButtonIzq")
	luzL = get_node("/root/Node2D/Pinball/Paredes/ParedesSprite/LuzL")
	luzR = get_node("/root/Node2D/Pinball/Paredes/ParedesSprite/LuzR")
	#print("Luz Izquierdo: ", luzL)
#--------------------------------------------------------------------------------------------------------------------	
func _input(event):
	#Este "IF" determina si es el flipper de la izquierda o el de la derecha (+ de 1 derecha)
	if global_position.x > 1:
	# Detecta si la tecla "Izq" es presionada o soltada
		if event.is_action_pressed("ui_right"):  # "ui_right"
			rotating = true
			if luzR != null:
				luzR.frame = 3
		elif event.is_action_released("ui_right"):
			rotating = false
			if luzR != null:
				luzR.frame = 2
	else:
		if event.is_action_pressed("ui_left"):  # "ui_left"
			rotating = true
			if luzL != null:
				luzL.frame = 1
		elif event.is_action_released("ui_left"):
			rotating = false
			if luzL != null:
				luzL.frame = 0
#--------------------------------------------------------------------------------------------------------------------	
func _process(delta):
	# Gira hacia el ángulo objetivo o regresa al ángulo original
	if rotating:
		rotation = lerp(rotation, target_angle, rotation_speed * delta)
	else:
		rotation = lerp(rotation, original_angle, rotation_speed * delta)
