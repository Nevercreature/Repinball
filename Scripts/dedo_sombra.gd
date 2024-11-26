extends AnimatedSprite2D

var nodo_dedo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nodo_dedo = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	frame = nodo_dedo.frame
