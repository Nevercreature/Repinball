extends Area2D

var nodo_Controlador
var nodo_Pinball
var brillo = preload("res://brillo.tscn")
var nuevoBrillo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nodo_Controlador = get_node("../Controlador") # Replace with function body.
	nodo_Pinball = get_node("../Pinball/") # Replace with function body.
	nuevoBrillo = brillo.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) ->void:
	#print("Entra aquí")
	nodo_Controlador.puntos_entero +=100
	nuevoBrillo.position = position
	nodo_Pinball.add_child(nuevoBrillo)
	queue_free()
