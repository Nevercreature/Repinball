extends Sprite2D

var time := 0.0
var velocidad_cambio_color = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	time += delta*velocidad_cambio_color
	var velocidad_cambio_color = 0.03
	var Velocidad_tiempo_color = 0.4
	'''
	if (self_modulate.r == 0 and self_modulate.g == 1):
		self_modulate.b -= velocidad_cambio_color
		await get_tree().create_timer(Velocidad_tiempo_color).timeout
		
	if (self_modulate.b == 0 and self_modulate.g == 1):
		self_modulate.r += velocidad_cambio_color
		await get_tree().create_timer(Velocidad_tiempo_color).timeout

	if (self_modulate.r == 1 and self_modulate.b == 0):
		self_modulate.g -= velocidad_cambio_color
		await get_tree().create_timer(Velocidad_tiempo_color).timeout

	if (self_modulate.r == 1 and self_modulate.g == 0):
		self_modulate.b += velocidad_cambio_color
		await get_tree().create_timer(Velocidad_tiempo_color).timeout
	
	if (self_modulate.g == 0 and self_modulate.b == 1):
		self_modulate.r -= velocidad_cambio_color
		await get_tree().create_timer(Velocidad_tiempo_color).timeout
		
	if (self_modulate.r == 0 and self_modulate.b == 1):
		self_modulate.g += velocidad_cambio_color
		await get_tree().create_timer(Velocidad_tiempo_color).timeout
   '''
	self_modulate.r = abs(sin(time + 0))
	self_modulate.g = abs(sin(time + 0.5))
	self_modulate.b = abs(sin(time + 1.0))
