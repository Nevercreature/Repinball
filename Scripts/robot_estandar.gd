extends CharacterBody2D

var colision
var nodo_Pinball

var numeroGolpes = 3
var explosion = preload("res://explosion_mediana.tscn")
var nueva_explosion

func _ready() -> void:
	nodo_Pinball = get_node("../Pinball/")
	nueva_explosion = explosion.instantiate()
	$AreaColision.connect("body_entered", Callable(self, "_on_body_entered"))

func _process(delta):
	controlAnimacion()
	
func _on_body_entered(objeto):
	if objeto is RigidBody2D:
		print("¡Colisión!")
		numeroGolpes -= 1
		#$AnimRobotEstandar.play("Fase02")

func controlAnimacion():
	if numeroGolpes >= 3:
		$AnimRobotEstandar.play("Fase01")
	elif numeroGolpes == 2:
		$AnimRobotEstandar.play("Fase02")
	elif numeroGolpes == 1:
		$AnimRobotEstandar.play("Fase03")
	else:
		nueva_explosion.position = position
		nodo_Pinball.add_child(nueva_explosion)
		await get_tree().create_timer(0.2).timeout 
		queue_free()

'''
func _physics_process(delta: float):
	colision = move_and_collide(velocity * delta)
	#print("Ha entrado aquí.")
	if colision:
		print("Hay colisión.")
		var objeto = colision.get_collider()
		if objeto:
			print("El objeto existe.")
		if objeto and objeto is RigidBody2D:
			print("Le ha dado la bola.")


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	'''
