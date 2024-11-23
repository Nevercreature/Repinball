extends Node2D

# Variables para los ángulos (en radianes)
var target_angle = deg_to_rad(-120)  # Ángulo objetivo al presionar "A"
var original_angle = deg_to_rad(0)           # Ángulo original (0 radianes)
var rotation_speed = 10           # Velocidad de rotación

# Variable para verificar si se está presionando "A"
var rotating = false

func _input(event):
	# Detecta si la tecla "A" es presionada o soltada
	if event.is_action_pressed("ui_left"):  # "ui_left" se asigna por defecto a "A" en los Input Map
		rotating = true
	elif event.is_action_released("ui_left"):
		rotating = false

func _process(delta):
	# Gira hacia el ángulo objetivo o regresa al ángulo original
	if rotating:
		rotation = lerp(rotation, target_angle, rotation_speed * delta)
	else:
		rotation = lerp(rotation, original_angle, rotation_speed * delta)
