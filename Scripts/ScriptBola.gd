extends RigidBody2D


var y_limit = 500 #Límite que si se sobrepasa se pierde bola
var velicidad_limite = 1160 #La velocidad límite a la que puede ir la bola
var gravedad = 0.5 #La gravedad a la que le afecta la bola.
var camara

func _ready():
	# Activa el _physics_process si es necesario
	set_physics_process(true)
	camara = get_node("%Camera2D")
	print("Camara 2D: ", camara)

func _fixed_process(delta):
	pass

func _process(delta):
	if position.y > y_limit:
		teletransportar_a(Vector2(-180.5,130))
	# Comprueba la magnitud de la velocidad
	if linear_velocity.length() > velicidad_limite:
		# Limita la velocidad manteniendo la dirección original
		linear_velocity = linear_velocity.normalized() * velicidad_limite
		
	#Esto es para comprobar las coordenadas de la bola
	#print('Coordenadas Bola: X=', position.x, ' Y=', position.y)
	
	#Esto es para que no se quede bloqueada la bola en los flippers
	if ((position.x > -63.37 and position.x < -63.35) and (position.y < 231.71 and position.y > 231.69)):
		apply_force(Vector2(20, 20), Vector2.ZERO)
	else:
		apply_force(Vector2(0, 0), Vector2.ZERO)
		
	if ((position.x > -63.34 and position.x < -63.32) and (position.y < 231.72 and position.y > 231.60)):
		apply_force(Vector2(-20, 20), Vector2.ZERO)
	else:
		apply_force(Vector2(0, 0), Vector2.ZERO)
		

func teletransportar_a(nueva_posicion: Vector2):
	# Cambiamos el estado de "sleeping" para evitar que se quede congelado. Y que no sea visible mientras se transporta
	freeze = true
	visible = false
	global_position.y = nueva_posicion.y
	global_position.x = nueva_posicion.x
	linear_velocity = Vector2.ZERO
	gravity_scale = 0
	
	camara.sacude_camara()
	
	await get_tree().create_timer(1).timeout #await get_tree().create_timer(0.5).timeout
	gravity_scale = gravedad
	freeze = false
	visible = true

	
